import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/pelayananDokter/component/container_log_pasien.dart';
import 'package:flutter/material.dart';

class ShowLogPage extends StatefulWidget {
  const ShowLogPage({super.key});

  @override
  State<ShowLogPage> createState() => _ShowLogState();
}

class _ShowLogState extends State<ShowLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pelayanan Dokter'),
      ),
      drawer: const DrawerPasien(),
      body: const HistoryLog(),
    );
  }
}
