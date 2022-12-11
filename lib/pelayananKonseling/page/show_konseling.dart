import 'package:flutter/material.dart';
import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/pelayananKonseling/component/container_pelayanan_konseling.dart';

class PelayananKonselingPage extends StatefulWidget {
  const PelayananKonselingPage({super.key});

  @override
  State<PelayananKonselingPage> createState() => _PelayananKonselingState();
}

class _PelayananKonselingState extends State<PelayananKonselingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelayanan Konseling'),
      ),
      drawer: const DrawerPasien(),
      body: const ListPelayananKonseling(),
    );
  }
}