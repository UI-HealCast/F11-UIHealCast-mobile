import 'package:flutter/material.dart';
import 'package:f11uihealcast/pelayananApotek/page/home_apotek.dart';
import 'package:f11uihealcast/pelayananApotek/component/form_obat.dart';
import 'package:f11uihealcast/pelayananApotek/page/display_data_obat.dart';
import 'package:f11uihealcast/pelayananApotek/page/display_status_obat.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Pelayanan Apotek'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePageApotek()),
            );
          },
        ),
        ListTile(
          title: const Text('Tambah Obat'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FormObatPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Data Obat'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DisplayObatPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Status Obat Pasien'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DisplayStatusObatPage()),
            );
          },
        ),
      ],
    ),
  );
}
