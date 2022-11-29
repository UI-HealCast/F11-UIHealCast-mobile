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
<br/>
Permasalahan sulitnya mendapatkan informasi pelayanan kesehatan membawa kita pada solusi berupa aplikasi sistem informasi kesehatan. Sistem informasi kesehatan ini terintegrasi dengan pihak penyedia jasa dan fasilitas kesehatan agar memudahkan masyarakat dalam mendapatkan informasi dan pelayanan secara efisien. Seiring berkembangnya teknologi, aplikasi mobile menjadi pilihan utama untuk membuat penggunaannya menjadi lebih efisien. Maka daripada itu, kelompok kami melakukan pengembangan aplikasi UIHealCast yang sudah dibentuk pada proyek tengah semester menjadi aplikasi berbasi mobile yang bernama UIHealCast Mobile. Aplikasi UIHealCast Mobile dapat membantu pasien RS UI dan Klinik Makara dalam mendapatkan informasi dan pelayanan kesehatan.
 
## 👨‍💻 Pengembang 👩‍💻
Proyek ini dibuat oleh kelompok F11 yang beranggotakan sebagai berikut:
- [Dianisa Wulandari](https://github.com/dianisa) (2106702150)
- [Kezia Natalia](https://github.com/kezianatalia) (2106703891)
- [Undissya Putri Maharani](https://github.com/UndissyaPutri) (2106650935)
- [Syahrul Apriansyah](https://github.com/SyahrulApr86) (2106708311)
- [Yudi Putra Sabri](https://github.com/yudiptr) (2106706123)

## 📋 Daftar Modul 📋
Berikut ini adalah daftar modul yang akan diimplementasikan beserta pengembang dari setiap modul:
* Pelayanan Dokter - [Yudi Putra Sabri](https://github.com/yudiptr)

Pelayanan Dokter adalah menu dimana pasien dapat membuat janji temu dan memilih dokter mana yang ia inginkan. Untuk mengimplementasikan fitur ini, diperlukan dua buah method http request berupa `post` dan `get`. `Post` digunakan untuk mengirimkan hasil dari janji temu dengan dokter yang berisi keluhan, nomor telefon, dan pilihan dokter. `Get` digunakan untuk mengambil data dokter yang sedang "ada" pada saat tersebut.

* Pelayanan Apotek - [Kezia Natalia](https://github.com/kezianatalia)

Pelayanan apotek adalah menu dimana pasien dapat melihat obat apa saja yang sedang tersedia pada sistem UIHealCast. Akan tetapi, untuk role apoteker, mereka daat melakukan update terkait informasi obat yang tersedia seperti menambahkan obat dan mengubah status ketersediaan obat. Pada fitur ini juga akan digunakan `post` yang akan digunakan untuk mengupdate status obat dan `get` untuk mengambil data obat.

* Pelayanan Konseling - [Syahrul Apriansyah](https://github.com/SyahrulApr86)

Pelayanan konseling adalah fitur dimana pasien dapat membuat janji konseling dengan dokter. Janji yang sudah diubah akan disimpan dalam database menggunakan `post` dan akan ditampilkan history konseling yang sudah pasien tersebut lakukan dengan methode `get`.

* Operasi - [Dianisa Wulandari](https://github.com/dianisa)

Pada fitur operasi, terdapat sebuah form dimana dokter dapat membuat jadwal operasi untuk pasien tertentu dengan menggunakan http `post`. Selain itu, dokter dan pasien juga dapat melihat jadwal operasi serta keterangan dari operasi yang didaftarkan untuk dirinya dengan menggunakan method `get`.

* Pembayaran - [Undissya Putri Maharani](https://github.com/UndissyaPutri)

Menu pembayaran adalah menu dimana pasien dapat melihat apakah pelayanan yang sudah pasien lakukan sudah dibayar atau belum dengan menggunakan `get`. Selain itu, dari role administrasi, mereka dapat mengubah status pembayaran dari pasien dan membuat catatan bulanan dengan menggunakan http `post`.


## 🔗 Integrasi dengan Situs Web 🔗
Berikut adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.

1. Mengimplementasikan sebuah _wrapper class_ dengan menggunakan library _http_ serta pbp_django_auth yang dibentuk oleh tim asdos untuk mendukung cookie, session, dan authentification pada app UI Health Care
2. Mengimplementasikan Django REST dengan menggunakan JsonResponse atau Django JSON Serializer untuk di request GET dalam apk.
3. Mengimplementasikan desain _front-end_ untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
4. Melakukan integrasi antara _front-end_ dengan _back-end_ dengan menggunakan konsep _asynchronous_ HTTP.

## 👥 Persona 👥
### 🔒 User Yang Tidak Login 🔒
Pengguna yang tidak Log In hanya akan dapat melihat dashboard. Drawer hanya akan berisi menu Log In.

### 🔑 User Yang Sudah Login 🔑

* Dokter :
Dapat menambahkan dan mengganti jadwal ketersediaan dokter. Selain itu, dokter juga dapat memberikan feedback setelah "pasien" telah selesai melakukan pelayanan dokter. Feedback tersebut dapat dilihat dari pasien itu sendiri. Untuk mengganti jadwal, digunakan http request dengan tipe `patch` untuk mengupdate status ketersediaan dokter tersebut pada real time. Untuk menambahkan feedback pasien setelah melakukan pelayanan dokter, digunakan `post` untuk mengubat feedback yang awalnya kosong menjadi sesuai apa yang ditulis oleh dokter. Dokter juga dapat membuat jadwal operasi untuk pasien tertentu serta melihat jadwal operasi yang didaftarkan untuk dirinya dengan menggunakan request `post` dan `get`.

* Pasien :
Dapat mengakses menu registrasi layanan dokter, menu operasi, konseling, serta menu pembayaran. Pasien juga dapat melihat history dari pelayananDokter, operasi, serta pelayananKonseling yang sudah dibuat dengan memanfaatkan http request `get`. Hasil dari history akan memberitahukan apakah status pelayanannya sudah selesai atau belum.

* Apoteker :
Dapat menambahkan info obat yang tersedia dan dapat menerima pesanan obat yang dibuat oleh pasien.

* Administrasi :
Mengubah status pembayaran dari pasien dengan menggunakan `post` serta membuat catatan bulanan pada sistem.



