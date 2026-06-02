-- ============================================================
-- LearnHub Membership — Supabase schema
-- Chạy toàn bộ file này trong: Supabase Dashboard > SQL Editor > New query > Run
-- ============================================================

-- 1) Bảng hồ sơ thành viên (gắn với auth.users)
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text unique,
  name text,
  role text not null default 'member',   -- 'member' | 'admin'
  created_at timestamptz not null default now()
);

-- 2) Bảng key-value lưu nội dung & cài đặt (JSON)
create table if not exists public.app_kv (
  key text primary key,                  -- 'content' | 'settings'
  value jsonb,
  updated_at timestamptz not null default now()
);

-- 3) Hàm kiểm tra admin (dùng trong RLS)
create or replace function public.is_admin()
returns boolean language sql security definer stable as $$
  select exists(select 1 from public.profiles where id = auth.uid() and role = 'admin');
$$;

-- 4) Tự tạo profile khi có người đăng ký
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into public.profiles (id, email, name, role)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'name', split_part(new.email, '@', 1)),
    'member'
  )
  on conflict (id) do nothing;
  return new;
end;$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ============================================================
-- RLS (Row Level Security)
-- ============================================================
alter table public.profiles enable row level security;
alter table public.app_kv  enable row level security;

-- profiles: tự xem hồ sơ mình; admin xem tất cả
drop policy if exists "profiles_select" on public.profiles;
create policy "profiles_select" on public.profiles
  for select using (id = auth.uid() or public.is_admin());

-- profiles: tự sửa tên mình; admin sửa mọi hồ sơ (đổi vai trò)
drop policy if exists "profiles_update_self" on public.profiles;
create policy "profiles_update_self" on public.profiles
  for update using (id = auth.uid()) with check (id = auth.uid());
drop policy if exists "profiles_update_admin" on public.profiles;
create policy "profiles_update_admin" on public.profiles
  for update using (public.is_admin()) with check (public.is_admin());

-- profiles: admin được xóa hồ sơ
drop policy if exists "profiles_delete_admin" on public.profiles;
create policy "profiles_delete_admin" on public.profiles
  for delete using (public.is_admin());

-- app_kv: 'settings' đọc công khai (để hiện thương hiệu ở trang login)
drop policy if exists "kv_select_settings_public" on public.app_kv;
create policy "kv_select_settings_public" on public.app_kv
  for select using (key = 'settings');

-- app_kv: nội dung khác chỉ người đã đăng nhập đọc được
drop policy if exists "kv_select_auth" on public.app_kv;
create policy "kv_select_auth" on public.app_kv
  for select using (auth.role() = 'authenticated');

-- app_kv: chỉ admin được ghi
drop policy if exists "kv_insert_admin" on public.app_kv;
create policy "kv_insert_admin" on public.app_kv
  for insert with check (public.is_admin());
drop policy if exists "kv_update_admin" on public.app_kv;
create policy "kv_update_admin" on public.app_kv
  for update using (public.is_admin()) with check (public.is_admin());
drop policy if exists "kv_delete_admin" on public.app_kv;
create policy "kv_delete_admin" on public.app_kv
  for delete using (public.is_admin());

-- ============================================================
-- 5) BOOTSTRAP ADMIN
-- Sau khi bạn ĐĂNG KÝ tài khoản admin trên web (hoặc tạo user trong
-- Authentication > Users), chạy dòng dưới (đổi email cho đúng) để cấp quyền admin:
-- ============================================================
-- update public.profiles set role = 'admin' where email = 'admin@learnhub.com';
