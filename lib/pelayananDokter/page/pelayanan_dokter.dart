import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:flutter/material.dart';
import 'package:f11uihealcast/pelayananDokter/component/form_pelayanan_dokter.dart';

class PelayananDokterPage extends StatefulWidget {
  const PelayananDokterPage({super.key});

  @override
  State<PelayananDokterPage> createState() => _PelayananDokterState();
}

class _PelayananDokterState extends State<PelayananDokterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pelayanan Dokter'),
      ),
      drawer: const DrawerPasien(),
      body: FormPelayananDokter(formKey: _formKey),
    );
  }
}
