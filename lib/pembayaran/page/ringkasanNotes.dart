import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/pembayaran/component/ringkasanForm.dart';
import 'package:flutter/material.dart';

class Ringkasan extends StatefulWidget {
  const Ringkasan({super.key});

  @override
  State<Ringkasan> createState() => _RingkasanState();
}

class _RingkasanState extends State<Ringkasan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Catatan Pembayaran'),
      ),
      drawer: const DrawerPasien(),
      body: const RingkasanForm(),
    );
  }
}
