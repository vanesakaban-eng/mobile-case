# Tugas 4 - Mobile Developer Documentation

Aplikasi Flutter ini dibuat untuk memenuhi tugas navigasi antar halaman (Stack Navigation) menggunakan kelas `Navigator` di Flutter. Aplikasi terdiri dari **Screen 1 (Beranda/Katalog)** yang menampilkan daftar paket dan **Screen 2 (Detail Katalog)** yang menggunakan `StatefulWidget`[cite: 1].

---

## 🚀 Fitur Aplikasi
- **Screen 1 (Beranda):** Menggunakan `StatelessWidget` dan `ListView` untuk menampilkan 3 kartu paket interaktif[cite: 1].
- **Stack Navigation:** Berpindah ke Screen 2 menggunakan `Navigator.push` saat tombol "Pilih Paket" diklik[cite: 1].
- **Screen 2 (Detail Katalog):** Menggunakan `StatefulWidget` dengan tata letak vertikal (`Column`), tombol *back*, serta container berlatar belakang pastel untuk teks deskripsi[cite: 1].
- **Interaktivitas State:** Memiliki tombol penanda (bookmark) interaktif di Screen 2[cite: 1].

---

## 🛠️ Cara Setup Project

1. **Clone Repository ini:**
   ```bash
   git clone [https://github.com/USERNAME/NAMA-REPO.git](https://github.com/USERNAME/NAMA-REPO.git)
   cd tugas_pertama