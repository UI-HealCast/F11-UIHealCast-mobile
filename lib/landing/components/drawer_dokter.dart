import 'package:f11uihealcast/landing/api/landing_api.dart';
import 'package:f11uihealcast/landing/page/list_pasien.dart';
import 'package:f11uihealcast/main.dart';
import 'package:f11uihealcast/operasi/page/form_jadwal_operasi.dart';
import 'package:f11uihealcast/operasi/page/jadwal_operasi_dokter.dart';
import 'package:f11uihealcast/pelayananApotek/page/data_obat_view_only.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class DrawerDokter extends StatelessWidget {
  const DrawerDokter({Key? key}) : super(key: key);

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
                          title: "Dokter",
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Menu Pasien'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ListPasienPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Buat Jadwal Operasi'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const FormJadwalOperasi()),
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
                    builder: (context) => const JadwalOperasiDokter()),
              );
            },
          ),
          ListTile(
            title: const Text('Lihat Data Obat'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViewOnlyObatPage()),
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
