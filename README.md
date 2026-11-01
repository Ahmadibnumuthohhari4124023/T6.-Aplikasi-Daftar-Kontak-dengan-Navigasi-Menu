# Tugas Praktikum Pertemuan 6 — Package Flutter & ListView

Aplikasi Flutter **Kontak App** yang menggabungkan 5 package Flutter dengan navigasi menu modern menggunakan `convex_bottom_bar`.

- **Repository GitHub**: [https://github.com/Ahmadibnumuthohhari4124023/T6.-Aplikasi-Daftar-Kontak-dengan-Navigasi-Menu](https://github.com/Ahmadibnumuthohhari4124023/T6.-Aplikasi-Daftar-Kontak-dengan-Navigasi-Menu)
- **Live Demo (GitHub Pages)**: [https://ahmadibnumuthohhari4124023.github.io/T6.-Aplikasi-Daftar-Kontak-dengan-Navigasi-Menu/](https://ahmadibnumuthohhari4124023.github.io/T6.-Aplikasi-Daftar-Kontak-dengan-Navigasi-Menu/)

---

## 📋 Fitur & Pemenuhan Rubrik Penilaian

| No | Kriteria & Rubrik | Package / Implementasi | Status | File Sumber |
|:--:|:---|:---|:--:|:---|
| 1 | **Navigasi Menu (25 Poin)**<br>ConvexAppBar berfungsi, perpindahan antar 3 menu lancar | `convex_bottom_bar: ^3.2.0`<br>Style: `TabStyle.reactCircle`<br>3 Menu: Kontak, Cari, Profil | ✅ Selesai | [`lib/pages/main_screen.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/pages/main_screen.dart) |
| 2 | **Halaman Kontak (15 Poin)**<br>Minimal 15 data kontak dummy (nama, nomor telepon, email) menggunakan Faker & ListView.builder | `faker: ^2.2.0`<br>`ListView.builder`<br>Menghasilkan 20 data dummy kontak terstruktur | ✅ Selesai | [`lib/pages/contacts_page.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/pages/contacts_page.dart)<br>[`lib/services/contact_service.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/services/contact_service.dart) |
| 3 | **Format Tanggal Lokal (15 Poin)**<br>Tiap kontak menampilkan tanggal "ditambahkan pada" memakai INTL locale Indonesia (mis. "05 September 2026") | `intl: ^0.20.3`<br>`DateFormat('dd MMMM yyyy', 'id_ID')`<br>`initializeDateFormatting('id_ID', null)` | ✅ Selesai | [`lib/models/contact.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/models/contact.dart)<br>[`lib/main.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/main.dart) |
| 4 | **Halaman Cari (15 Poin)**<br>DropdownSearch untuk memilih kategori kontak dari daftar offline (Keluarga, Teman, Kerja, dll.) | `dropdown_search: 5.0.6`<br>Daftar offline: Semua Kategori, Keluarga, Teman, Kerja, Bisnis, Organisasi + search bar | ✅ Selesai | [`lib/pages/search_page.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/pages/search_page.dart) |
| 5 | **Halaman Profil (15 Poin)**<br>Foto profil dengan efek animasi AvatarGlow | `avatar_glow: ^3.0.1`<br>Glowing melingkar halus dengan info profil & statistik | ✅ Selesai | [`lib/pages/profile_page.dart`](file:///c:/Users/Muthohhari/Downloads/T6/lib/pages/profile_page.dart) |
| 6 | **Kerapian Kode & Test (15 Poin)**<br>Struktur rapi, penamaan konsisten, lolos analisis dan pengujian | Modular architecture (models, services, pages, widgets)<br>`flutter analyze` (0 error, 0 warning)<br>`flutter test` (Semua test lulus) | ✅ Selesai | [`test/widget_test.dart`](file:///c:/Users/Muthohhari/Downloads/T6/test/widget_test.dart) |

---

## 📁 Struktur Direktori Proyek

```
T6/
├── .github/
│   └── workflows/
│       └── deploy.yml                 # CI/CD otomatis deploy ke GitHub Pages
├── lib/
│   ├── main.dart                      # Inisialisasi INTL locale 'id_ID' & konfigurasi tema Material 3
│   ├── models/
│   │   └── contact.dart               # Model data kontak & getter formattedAddedAt (dd MMMM yyyy)
│   ├── services/
│   │   └── contact_service.dart       # Generator data kontak dummy menggunakan faker
│   ├── pages/
│   │   ├── main_screen.dart           # Layar utama dengan ConvexAppBar 3 Tab (Kontak, Cari, Profil)
│   │   ├── contacts_page.dart         # Halaman Kontak (ListView.builder, 20 dummy data, tombol Tambah)
│   │   ├── search_page.dart           # Halaman Cari (DropdownSearch kategori offline & filter real-time)
│   │   └── profile_page.dart          # Halaman Profil (AvatarGlow, data pengguna, ringkasan praktikum)
│   └── widgets/
│       └── contact_card.dart          # Widget kartu kontak (avatar inisial, kategori, telp, email, tanggal)
├── test/
│   └── widget_test.dart               # Test suite otomatis (ConvexAppBar, ListView, DropdownSearch, AvatarGlow)
└── pubspec.yaml                       # Konfigurasi dependensi package Flutter
```

---

## 🚀 Cara Menjalankan Aplikasi

1. Buka terminal pada folder proyek ini:
   ```bash
   cd c:\Users\Muthohhari\Downloads\T6
   ```

2. Jalankan aplikasi pada perangkat yang tersedia:
   - **Web Browser (Edge / Chrome)**:
     ```bash
     flutter run -d edge
     ```
   - **Windows Desktop**:
     ```bash
     flutter run -d windows
     ```
   - **Android Emulator / Device**:
     ```bash
     flutter run
     ```

3. Menjalankan pengujian (Automated Tests):
   ```bash
   flutter test
   ```

4. Menjalankan analisis kode:
   ```bash
   flutter analyze
   ```
