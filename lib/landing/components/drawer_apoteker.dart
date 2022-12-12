import 'package:f11uihealcast/landing/api/landing_api.dart';
import 'package:f11uihealcast/main.dart';
import 'package:f11uihealcast/operasi/page/jadwal_operasi_pasien.dart';
import 'package:f11uihealcast/pelayananApotek/component/form_obat.dart';
import 'package:f11uihealcast/pelayananDokter/page/pelayanan_dokter.dart';
import 'package:f11uihealcast/pelayananDokter/page/show_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:f11uihealcast/pelayananApotek/page/display_data_obat.dart';
import 'package:f11uihealcast/pelayananApotek/page/display_status_obat.dart';

class DrawerApoteker extends StatelessWidget {
  const DrawerApoteker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "Apoteker",
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Pelayanan Dokter'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PelayananDokterPage()),
              );
            },
          ),
          ListTile(
            title: const Text('History Pelayanan Dokter'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShowLogPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Jadwal Operasi'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const JadwalOperasiPasien()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Obat'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FormObatPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Update Data Obat'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DisplayObatPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Update Status Obat Pasien'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DisplayStatusObatPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Route menu ke halaman utama
              logout(request);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "-",
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
