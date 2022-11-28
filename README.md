[![Develop](https://github.com/UI-HealCast/F11-UIHealCast-mobile/actions/workflows/develop.yml/badge.svg)](https://github.com/UI-HealCast/F11-UIHealCast-mobile/actions/workflows/develop.yml)
[![Pre-Release](https://github.com/UI-HealCast/F11-UIHealCast-mobile/actions/workflows/pre-release.yml/badge.svg)](https://github.com/UI-HealCast/F11-UIHealCast-mobile/actions/workflows/pre-release.yml)
[![Release](https://github.com/UI-HealCast/F11-UIHealCast-mobile/actions/workflows/release.yml/badge.svg)](https://github.com/UI-HealCast/F11-UIHealCast-mobile/actions/workflows/release.yml)

# UI HealCast

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

## 📋 Latar Belakang 📋
Arsitektur Kesehatan menjadi salah satu isu penting yang dibahas dalam Presidensi G20 Indonesia 2022. Fokus dari isu ini adalah melakukan transformasi infrastruktur kesehatan global untuk meningkatkan pencegahan, kesiagaan, dan responsivitas penanganan. Sejalan dengan tema presidensi G20 “Recover Together, Recover Stronger”, pelayanan kesehatan harus inklusif dan responsif. Hal ini dapat diwujudkan dengan melakukan transformasi terhadap sistem informasi kesehatan agar semua kalangan dapat mengakses pelayanan kesehatan dengan mudah.
Permasalahan sulitnya mendapatkan informasi pelayanan kesehatan membawa kita pada solusi berupa aplikasi sistem informasi kesehatan. Sistem informasi kesehatan ini terintegrasi dengan pihak penyedia jasa dan fasilitas kesehatan agar memudahkan masyarakat dalam mendapatkan informasi dan pelayanan secara efisien. Aplikasi ini akan membantu pasien RS UI dan Klinik Makara dalam mendapatkan informasi dan pelayanan kesehatan.
 
## 👨‍💻 Pengembang 👩‍💻
Proyek ini dibuat oleh kelompok F11 yang beranggotakan sebagai berikut:
- [Dianisa Wulandari](https://github.com/dianisa) (2106702150)
- [Kezia Natalia](https://github.com/kezianatalia) (2106703891)
- [Undissya Putri Maharani](https://github.com/UndissyaPutri) (2106650935)
- [Syahrul Apriansyah](https://github.com/SyahrulApr86) (2106708311)
- [Yudi Putra Sabri](https://github.com/yudiptr) (2106706123)

## 📋 Daftar Modul 📋
Berikut ini adalah daftar modul yang akan diimplementasikan beserta pengembang dari setiap modul:
- Pelayanan Dokter - [Yudi Putra Sabri](https://github.com/yudiptr)
- Pelayanan Apotek - [Kezia Natalia](https://github.com/kezianatalia)
- Pelayanan Konseling - [Syahrul Apriansyah](https://github.com/SyahrulApr86)
- Operasi - [Dianisa Wulandari](https://github.com/dianisa)
- Pembayaran - [Undissya Putri Maharani](https://github.com/UndissyaPutri)

## 👥 Persona 👥
### 🔒 User Yang Tidak Login 🔒
Aplikasi hanya dapat digunakan setelah user Log In

### 🔑 User Yang Sudah Login 🔑

Dokter :
Dapat menambahkan dan mengganti jadwal ketersediaan dokter.

Pasien :
Dapat mengakses menu registrasi layanan dokter, menu operasi, konseling, serta menu pembayaran.

Apoteker :
Dapat menambahkan info obat yang tersedia dan dapat menerima pesanan obat yang dibuat oleh pasien

Administrasi :
Mengatur transaksi pembayaran dengan pasien


## 🔗 Integrasi dengan Situs Web 🔗
Berikut adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.

1. Mengimplementasikan sebuah _wrapper class_ dengan menggunakan library _http_ serta pbp_django_auth yang dibentuk oleh tim asdos untuk mendukung cookie, session, dan authentification pada app UI Health Care
2. Mengimplementasikan Django REST dengan menggunakan JsonResponse atau Django JSON Serializer untuk di request GET dalam apk.
3. Mengimplementasikan desain _front-end_ untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
4. Melakukan integrasi antara _front-end_ dengan _back-end_ dengan menggunakan konsep _asynchronous_ HTTP.

