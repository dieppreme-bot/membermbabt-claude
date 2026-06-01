# 🎓 LearnHub — Membership & Knowledge Portal

> Nền tảng học tập dạng membership hoàn chỉnh — chạy từ **một file HTML duy nhất**, không cần server, không cần cài đặt.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![HTML](https://img.shields.io/badge/HTML-single--file-orange)
![No Build](https://img.shields.io/badge/build-none%20required-brightgreen)

---

## 📋 Mục lục

- [Tổng quan](#-tổng-quan)
- [Tính năng](#-tính-năng)
- [Demo & Cách dùng nhanh](#-demo--cách-dùng-nhanh)
- [Đăng nhập](#-đăng-nhập)
- [Hướng dẫn học viên](#-hướng-dẫn-học-viên)
- [Hướng dẫn Admin](#-hướng-dẫn-admin)
- [Cài đặt giao diện](#-cài-đặt-giao-diện)
- [Deploy lên Vercel / GitHub Pages](#-deploy)
- [Cấu trúc file](#-cấu-trúc-file)
- [Lưu trữ dữ liệu](#-lưu-trữ-dữ-liệu)
- [Phím tắt](#-phím-tắt)
- [Câu hỏi thường gặp](#-câu-hỏi-thường-gặp)

---

## 🌟 Tổng quan

**LearnHub** là hệ thống membership portal & knowledge base hoàn chỉnh được đóng gói trong **một file HTML duy nhất**. Phù hợp cho:

- 📚 Khóa học online / knowledge base cá nhân hoặc doanh nghiệp nhỏ
- 🏢 Nội bộ công ty — tài liệu đào tạo nhân viên
- 💡 Creator — bán kiến thức, membership content
- 🛠️ Prototype / MVP nhanh cho sản phẩm học tập

**Không cần:** backend, database, npm install, build step, hay bất kỳ phụ thuộc nào ngoài trình duyệt.

---

## ✨ Tính năng

### 👤 Phía học viên
| Tính năng | Chi tiết |
|-----------|----------|
| **Đăng nhập / Đăng ký** | Xác thực bằng email + mật khẩu, lưu trong localStorage |
| **Dashboard** | Thống kê tiến độ, banner tiếp tục học, hoạt động gần đây |
| **Thư viện kiến thức** | Duyệt toàn bộ nội dung, lọc theo danh mục hoặc trạng thái học |
| **Chi tiết khóa học** | Cây chương → bài học, thanh tiến độ từng chương |
| **Đọc bài học** | Popup reader đầy đủ, render HTML, đánh dấu hoàn thành |
| **Bài học phụ** | Hỗ trợ sub-lessons, đánh dấu độc lập |
| **Dark mode** | Hỗ trợ chế độ tối toàn giao diện |

### 🔐 Quản trị (Admin)
| Tính năng | Chi tiết |
|-----------|----------|
| **Tổng quan Admin** | Thống kê: số topic, khóa học, bài học, thành viên |
| **Quản lý nội dung** | Cây 4 cấp: Topic → Khóa học → Chương → Bài học |
| **CRUD đầy đủ** | Thêm, sửa, xóa tất cả cấp. Confirm trước khi xóa |
| **Kéo thả sắp xếp** | Drag & drop đổi thứ tự bài học trong chương |
| **Import bài học CSV** | Bulk import từ file .csv với template sẵn |
| **Editor bài học** | Rich text editor với 20+ nút toolbar |
| **Quản lý thành viên** | Xem, thêm, xóa, phân quyền admin, tìm kiếm |
| **Import/Export thành viên** | Import CSV, xuất danh sách CSV |
| **Cài đặt giao diện** | Tên web, logo, favicon, màu sắc, font, SEO |
| **Banner thông báo** | Announcement bar đầu trang có link và màu tuỳ chỉnh |
| **Popup marketing** | Popup có ảnh, tiêu đề, nội dung, nút CTA |
| **Link Tổng quan** | Thêm link tùy chỉnh vào sidebar, sắp xếp thứ tự |

### ✏️ Editor bài học
- **Định dạng văn bản:** Bold, Italic, Underline, Strikethrough, màu chữ, màu nền
- **Tiêu đề:** H1, H2, H3, Blockquote, Code block
- **Font & kích thước:** 5 font, 9 cỡ chữ
- **Căn lề:** Trái, giữa, phải, đều
- **Danh sách:** Bullet, Numbered, Indent, Outdent
- **Chèn nội dung:** Ảnh (URL/upload), Video YouTube, Bảng, HTML tùy chỉnh
- **Khối đặc biệt:** Toggle (accordion), Textbox, Callout ghi chú, Callout cảnh báo
- **Tiện ích:** Emoji picker, Link, Divider, Undo/Redo
- **Paste thông minh:** Tự nhận bảng Markdown từ Excel/Google Sheets
- **Phím tắt:** `Ctrl+S` lưu bài, `Ctrl+Z` undo

---

## 🚀 Demo & Cách dùng nhanh

### Cách 1 — Mở trực tiếp (offline)
```
Tải index.html → Mở bằng Chrome / Edge / Firefox
```
Không cần internet sau lần đầu load (Tailwind CSS cần kết nối lần đầu).

### Cách 2 — GitHub Pages (online, miễn phí)
```
https://dieppreme-bot.github.io/membermbabt-claude/
```

### Cách 3 — Deploy lên Vercel (khuyến nghị)
Xem phần [Deploy](#-deploy) bên dưới.

---

## 🔐 Đăng nhập

### Tài khoản thành viên (demo)
| Trường | Giá trị |
|--------|---------|
| Email | Bất kỳ email hợp lệ |
| Mật khẩu | Bất kỳ (tối thiểu 6 ký tự) |

> Nếu email chưa tồn tại → hệ thống tự tạo tài khoản mới.

### Tài khoản Admin (mặc định)
| Trường | Giá trị |
|--------|---------|
| Email | `admin@learnhub.com` |
| Mật khẩu | `admin123` |

> Tài khoản admin được tạo tự động khi khởi động lần đầu.

---

## 📖 Hướng dẫn học viên

```
Đăng nhập → Dashboard → Thư viện kiến thức → Chọn khóa học → Đọc bài
```

1. **Dashboard** — Xem tiến độ tổng quan, tiếp tục bài đang học dở
2. **Thư viện** — Click "Thư viện kiến thức" trên sidebar. Lọc: *Tất cả / Đang học / Hoàn thành*
3. **Danh mục** — Click tên danh mục trên sidebar để lọc theo chủ đề
4. **Khóa học** — Click card → xem chi tiết chương và bài học
5. **Đọc bài** — Click tên bài → popup reader. Bấm "Đánh dấu hoàn thành" khi xong
6. **Tiến độ** — Cột phải trang khóa học cập nhật % hoàn thành theo thời gian thực

---

## 🛠️ Hướng dẫn Admin

### Truy cập Admin
Đăng nhập bằng `admin@learnhub.com` → Sidebar hiện thêm mục **Quản trị**.

### Quản lý nội dung

Cấu trúc nội dung 4 cấp:
```
📁 Topic (Danh mục)
  └── 📘 Khóa học
        └── 📑 Chương
              └── 📄 Bài học
```

**Thêm mới:**
- **Topic:** Nút `+ Thêm topic mới` → nhập tên, icon emoji, màu HEX
- **Khóa học:** Chọn topic trên cây → `+ Thêm khóa` trong form bên phải
- **Chương:** Chọn khóa học → `+ Thêm chương`
- **Bài học:** Chọn chương → `+ Thêm bài học` → tự chuyển sang editor

**Chỉnh sửa:** Click vào tên mục trên cây → form hiện bên phải → Sửa → **Lưu**

**Xóa:** Nút đỏ trong form (xóa chương = xóa toàn bộ bài bên trong)

**Kéo thả:** Giữ biểu tượng `⠿⠿` bên phải tên bài → kéo lên/xuống trong cùng chương

### Import bài học hàng loạt (CSV)

```csv
topic,course,chapter,lesson_title,lesson_type,duration
Marketing,Marketing Cơ Bản,Chương 1,Bài về SEO,doc,15p
Marketing,Digital Marketing A-Z,Chương 2,Video về Ads,video,30p
```

`lesson_type`: `doc` | `video` | `quiz`

### Editor bài học

1. Vào **Viết bài mới** hoặc click ✎ bên cạnh tên bài
2. Điền: Tiêu đề · Loại (Video/Tài liệu/Quiz) · Thời lượng
3. Soạn nội dung bằng toolbar
4. Lưu: Nút **Lưu** màu xanh lá hoặc `Ctrl+S`
5. Preview: Nút **Xem trước** — hiện đúng như học viên thấy

### Quản lý thành viên

| Thao tác | Cách thực hiện |
|----------|---------------|
| Thêm 1 người | Nút `+ Thêm 1 thành viên` → điền form |
| Import nhiều người | Nút `Import CSV/Excel` → tải template → upload |
| Xuất danh sách | Nút `Xuất CSV` |
| Đổi quyền Admin | Nút `Role` bên cạnh thành viên |
| Xóa thành viên | Nút `Xóa` (không thể xóa tài khoản đang đăng nhập) |
| Tìm kiếm | Gõ vào ô Search (lọc realtime theo tên/email) |

**Format CSV import thành viên:**
```csv
name,email,password,role
Nguyễn Văn A,a@email.com,123456,member
Trần Thị B,b@email.com,abcdef,admin
```

---

## ⚙️ Cài đặt giao diện

Vào **Cài đặt giao diện** trên sidebar admin.

### Thương hiệu
| Trường | Mô tả |
|--------|-------|
| Tên web | Hiển thị ở sidebar, auth page, browser tab |
| Tagline | Dòng mô tả bên dưới tên |
| Logo | URL hoặc upload file (base64) |
| Favicon | Emoji hoặc URL ảnh .png/.ico |

### Giao diện
| Trường | Mô tả |
|--------|-------|
| Màu primary | Màu chính — gradient, nút, progress bar |
| Màu secondary | Màu phụ — gradient kết hợp với primary |
| Font heading | Inter · Arial · Georgia · Times New Roman · Fira Code |
| Font body | Như trên |
| Dark mode | Toggle bật/tắt chế độ tối |

### Marketing
- **Banner thông báo:** Text + link + màu nền, hiện đầu trang sau đăng nhập
- **Popup marketing:** Ảnh banner + tiêu đề + nội dung + nút CTA + tần suất hiện
- **Link Tổng quan:** Link tùy chỉnh trên sidebar (icon + tên + URL + mở tab/cùng tab)

### SEO
- Meta title, meta description, meta keywords

> ⚠️ Nhớ bấm **Lưu cài đặt giao diện** và **Lưu Marketing** riêng biệt.

---

## 🌐 Deploy

### GitHub Pages (miễn phí, public)

1. Push code lên GitHub (đã làm)
2. Vào repo → **Settings** → **Pages**
3. Source: `Deploy from a branch` → Branch: `main` → Folder: `/(root)`
4. Bấm **Save** → chờ ~1 phút

**URL:** `https://dieppreme-bot.github.io/membermbabt-claude/`

### Vercel (khuyến nghị — nhanh hơn, custom domain)

```bash
# Cài Vercel CLI
npm i -g vercel

# Deploy từ thư mục deploy-membership
cd deploy-membership
vercel

# Deploy production
vercel --prod
```

Hoặc kéo thả folder vào [vercel.com/new](https://vercel.com/new).

### Netlify (kéo thả)

1. Vào [netlify.com](https://netlify.com) → **Add new site** → **Deploy manually**
2. Kéo thả folder `deploy-membership` vào vùng upload
3. Nhận URL ngay lập tức

---

## 📁 Cấu trúc file

```
membermbabt-claude/
├── index.html      # Toàn bộ ứng dụng — HTML + CSS + JavaScript
└── guide.html      # Hướng dẫn sử dụng chi tiết (có sidebar điều hướng)
```

### Bên trong `index.html`

```
index.html
├── <style>          # Toàn bộ CSS (Tailwind CDN + custom styles)
├── Auth page        # Màn hình đăng nhập / đăng ký
├── App layout
│   ├── Sidebar      # Navigation + category list
│   └── Main
│       ├── Dashboard        # Trang chủ học viên
│       ├── Library          # Thư viện kiến thức
│       ├── Course detail    # Chi tiết khóa học + chương + bài
│       ├── Admin Dashboard  # Tổng quan Admin
│       ├── Admin Content    # Quản lý nội dung (cây)
│       ├── Admin Editor     # Rich text editor
│       ├── Admin Members    # Quản lý thành viên
│       └── Admin Settings   # Cài đặt giao diện
├── Modals           # Member modal, Import modal, Editor modals...
└── <script>         # Toàn bộ JavaScript (~1500 dòng)
    ├── DATA         # Dữ liệu demo mặc định
    ├── State & Auth # Quản lý trạng thái, đăng nhập
    ├── Navigation   # showView(), routing
    ├── Render       # Các hàm render UI
    ├── Admin CRUD   # Thêm/sửa/xóa nội dung
    ├── Editor       # Rich text editor logic
    ├── Members      # Quản lý thành viên
    └── Settings     # Cài đặt giao diện
```

---

## 💾 Lưu trữ dữ liệu

Toàn bộ dữ liệu lưu trong **localStorage** của trình duyệt — không cần server.

| Key | Nội dung | Kích thước điển hình |
|-----|----------|---------------------|
| `lh_users` | Danh sách tài khoản (tên, email, pass hash, role) | < 10KB |
| `lh_content` | Cây nội dung toàn bộ (topic → bài học + HTML content) | 50KB–5MB |
| `lh_site_settings` | Cài đặt giao diện (brand, colors, popup...) | < 5KB |
| `lh_progress` | Tiến độ học tập của từng user | < 20KB |

### ⚠️ Lưu ý quan trọng
- **Xóa cache trình duyệt = mất toàn bộ dữ liệu**
- Mỗi máy/trình duyệt có localStorage riêng → không đồng bộ giữa thiết bị
- Dữ liệu không mã hóa — không lưu thông tin nhạy cảm thật

### 💡 Backup thủ công
```javascript
// Mở DevTools (F12) → Console → Chạy lệnh này để export toàn bộ data
copy(JSON.stringify(localStorage))

// Để restore, chạy:
Object.entries(JSON.parse(/* paste data here */)).forEach(([k,v]) => localStorage.setItem(k,v))
```

---

## ⌨️ Phím tắt

| Phím | Chức năng | Context |
|------|-----------|---------|
| `Ctrl + S` | Lưu bài học đang soạn | Editor |
| `Ctrl + Z` | Undo | Editor |
| `Ctrl + B` | In đậm | Editor |
| `Ctrl + I` | In nghiêng | Editor |
| `Enter` | Submit form đăng nhập/đăng ký | Auth page |

---

## ❓ Câu hỏi thường gặp

<details>
<summary><strong>Đổi tên web từ "LearnHub" sang tên khác?</strong></summary>

Vào **Cài đặt giao diện** → mục Thương hiệu → đổi **Tên web** → bấm **Lưu cài đặt giao diện**. Áp dụng ngay cho sidebar, auth page và browser tab.

</details>

<details>
<summary><strong>Quên mật khẩu admin?</strong></summary>

Mở DevTools (F12) → Console → chạy:
```javascript
const u = JSON.parse(localStorage.lh_users);
u.find(x => x.email === 'admin@learnhub.com').pass = 'admin123';
localStorage.lh_users = JSON.stringify(u);
location.reload();
```

</details>

<details>
<summary><strong>Muốn nhiều người cùng dùng chung một database?</strong></summary>

localStorage chỉ là local — không chia sẻ được giữa máy khác nhau. Để nhiều người dùng chung, cần tích hợp backend (Firebase, Supabase...). Hiện tại, deploy lên Vercel/GitHub Pages chỉ cho phép mỗi thiết bị có dữ liệu riêng.

</details>

<details>
<summary><strong>Xóa cache trình duyệt thì có mất nội dung đã viết không?</strong></summary>

Có — localStorage bị xóa khi clear browser data. Nên **backup định kỳ** bằng lệnh ở phần [Backup](#-lưu-ý-quan-trọng) trên.

</details>

<details>
<summary><strong>Có thể thêm sub-lesson (bài học phụ) từ admin không?</strong></summary>

Hiện tại sub-lessons chỉ có trong dữ liệu demo. Quản lý sub-lesson qua admin đang trong roadmap phát triển.

</details>

<details>
<summary><strong>File index.html nặng bao nhiêu?</strong></summary>

Khoảng **200KB** (chưa kể nội dung bài học được thêm vào). Tailwind CSS load qua CDN (~30KB gzip). Tổng lần đầu load khoảng 500KB — rất nhẹ so với SPA thông thường.

</details>

---

## 🛤️ Roadmap

- [ ] Tìm kiếm toàn văn (full-text search) trong thư viện
- [ ] Quản lý sub-lesson từ Admin
- [ ] Export nội dung ra file JSON/ZIP để backup
- [ ] Tích hợp Firebase cho multi-device sync
- [ ] Hỗ trợ đa ngôn ngữ (i18n)
- [ ] Quiz engine với tính điểm và kết quả
- [ ] Thông báo deadline và nhắc học

---

## 🧰 Tech Stack

| Công nghệ | Vai trò |
|-----------|---------|
| **HTML5** | Markup và cấu trúc ứng dụng |
| **Tailwind CSS** (CDN) | Utility-first styling |
| **Vanilla JavaScript** | Toàn bộ logic — không framework |
| **localStorage API** | Lưu trữ dữ liệu phía client |
| **contentEditable API** | Rich text editor |
| **Drag & Drop API** | Kéo thả sắp xếp bài học |
| **FileReader API** | Upload ảnh, import CSV |
| **Google Fonts** | Inter + Fira Code |

---

## 📄 License

MIT License — sử dụng tự do cho cá nhân và thương mại.

---

## 🙏 Credits

Xây dựng bằng [Claude AI](https://claude.ai) · Powered by [Anthropic](https://anthropic.com)

---

<div align="center">

**[🌐 Live Demo](https://dieppreme-bot.github.io/membermbabt-claude/)** · **[📖 Hướng dẫn chi tiết](https://dieppreme-bot.github.io/membermbabt-claude/guide.html)** · **[🐛 Báo lỗi](https://github.com/dieppreme-bot/membermbabt-claude/issues)**

</div>
