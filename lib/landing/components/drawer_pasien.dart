import 'package:f11uihealcast/landing/api/landing_api.dart';
import 'package:f11uihealcast/main.dart';
import 'package:f11uihealcast/pelayananDokter/page/pelayanan_dokter.dart';
import 'package:f11uihealcast/pelayananDokter/page/show_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class DrawerPasien extends StatelessWidget {
  const DrawerPasien({Key? key}) : super(key: key);

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
                          title: "Pasien",
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