import 'package:f11uihealcast/main.dart';
import 'package:f11uihealcast/pelayananDokter/component/container_log_pasien.dart';
import 'package:f11uihealcast/pelayananDokter/page/pelayanan_dokter.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          title: "UI Health Care",
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
                MaterialPageRoute(builder: (context) => const HistoryLog()),
              );
            },
          ),
        ],
      ),
    );
  }
}
