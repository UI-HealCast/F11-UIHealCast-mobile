import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/pembayaran/component/pembayaran.dart';
import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
      ),
      drawer: const DrawerPasien(),
      body: const PembayaranPage(),
    );
  }
}