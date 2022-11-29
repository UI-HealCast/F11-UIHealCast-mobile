import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/pelayananDokter/component/container_log_pasien.dart';
import 'package:flutter/material.dart';

class ShowLogPage extends StatelessWidget {
  const ShowLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pelayanan Dokter'),
      ),
      drawer: const MyDrawer(),
      body: const HistoryLog(),
    );
  }
}
