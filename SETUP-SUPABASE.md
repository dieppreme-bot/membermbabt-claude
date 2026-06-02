# 🚀 Hướng dẫn bật Database (Supabase) + Deploy chuẩn

App hiện chạy 2 chế độ tự động:
- **Chưa điền key Supabase** → chạy offline bằng localStorage (như cũ, để test).
- **Đã điền key** → dùng database thật: mọi người đăng nhập từ mọi máy đều thấy **chung nội dung**, admin quản lý tập trung.

Làm theo 6 bước dưới đây (khoảng 20–30 phút).

---

## Bước 1 — Tạo project Supabase (miễn phí)
1. Vào https://supabase.com → **Sign in** (đăng nhập bằng GitHub).
2. **New project** → đặt tên (vd: `learnhub`), đặt **Database Password** (lưu lại), chọn **Region: Southeast Asia (Singapore)**.
3. Chờ ~2 phút cho project khởi tạo xong.

## Bước 2 — Lấy 2 khóa API
1. Vào **Project Settings** (bánh răng) → **API**.
2. Copy 2 giá trị:
   - **Project URL** — dạng `https://abcdxyz.supabase.co`
   - **anon public** key — chuỗi dài bắt đầu `eyJ...`

> ⚠️ Chỉ dùng key **anon public**. KHÔNG dán key `service_role` vào web (key đó bí mật).

## Bước 3 — Tạo bảng + bảo mật
1. Vào **SQL Editor** → **New query**.
2. Mở file `supabase-schema.sql` (kèm trong repo này), copy toàn bộ, dán vào.
3. Bấm **Run**. Thấy "Success" là xong (đã tạo bảng `profiles`, `app_kv`, RLS, trigger).

## Bước 4 — Tắt xác nhận email (cho dễ test ban đầu)
1. Vào **Authentication** → **Providers** → **Email**.
2. Tắt **Confirm email** (Off) → **Save**.
   - Mục đích: đăng ký xong đăng nhập được ngay, không cần bấm link email.
   - (Khi chạy thật cho khách, có thể bật lại để xác thực email.)

## Bước 5 — Dán key vào web
Mở file `index.html`, tìm gần đầu phần `<script>` đoạn:
```js
const LH_CLOUD = {
  url: '',          // dán Project URL
  anonKey: '',      // dán anon public key
  adminEmails: ['admin@learnhub.com']  // email admin của bạn
};
```
Điền vào:
```js
const LH_CLOUD = {
  url: 'https://abcdxyz.supabase.co',
  anonKey: 'eyJhbGciOiJI...key-rat-dai...',
  adminEmails: ['email-cua-ban@gmail.com']
};
```
> `adminEmails` để chắc chắn email của bạn luôn là admin.

## Bước 6 — Tạo admin đầu tiên
1. Mở web → tab **Tạo tài khoản** → đăng ký bằng email admin của bạn.
2. Vào lại Supabase → **SQL Editor**, chạy (đổi email cho đúng):
   ```sql
   update public.profiles set role = 'admin' where email = 'email-cua-ban@gmail.com';
   ```
3. Đăng xuất và đăng nhập lại trên web → giờ bạn là **admin**, viết bài sẽ lưu lên cloud.

✅ Xong! Giờ nội dung bạn viết được lưu trên Supabase. Học viên đăng nhập từ máy khác sẽ thấy chung.

---

## Deploy lên Vercel + tên miền riêng

### A. Deploy Vercel
1. Vào https://vercel.com → **Add New → Project** → **Import** repo `membermbabt-claude`.
2. Framework Preset: **Other** (đây là static HTML). Root để mặc định.
3. **Deploy** → nhận URL `…vercel.app`.
   - Vì đã dán key Supabase vào `index.html` rồi commit, bản deploy tự chạy với database.

### B. Gắn tên miền
1. Mua domain (Namecheap / inet.vn / pa.vn…).
2. Vercel → Project → **Settings → Domains → Add** → nhập `tenban.com`.
3. Làm theo bản ghi DNS Vercel hướng dẫn (A record hoặc CNAME) tại trang quản lý domain.
4. Chờ vài phút → HTTPS tự động. Xong.

---

## Quản lý database hằng ngày
- **Nội dung** (topic/khóa/chương/bài): quản lý ngay trong web admin → lưu tự động lên cloud.
- **Thành viên**: 
  - Xem/đổi vai trò/xóa: trong web admin → **Quản lý thành viên**.
  - Hoặc xem trực tiếp ở Supabase → **Authentication → Users** và bảng **Table Editor → profiles**.
- **Sao lưu**: Supabase → **Table Editor → app_kv** → cột `value` (key='content') là toàn bộ nội dung. Có thể export bảng ra CSV/JSON.

## Lưu ý
- Bản miễn phí Supabase: 500MB DB, 50.000 người dùng, đủ cho giai đoạn đầu.
- Khi bật **Confirm email**, người đăng ký phải bấm link trong email mới đăng nhập được.
- Admin thêm thành viên trong web: tạo được tài khoản + mật khẩu; nếu bật confirm email thì thành viên cần xác nhận.
- Xóa thành viên trong web chỉ xóa hồ sơ (profiles); muốn xóa hẳn tài khoản đăng nhập, xóa trong Supabase → Authentication → Users.
