import 'package:flutter/material.dart';
import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/pelayananKonseling/component/form_konseling.dart';

class KonselingPage extends StatefulWidget {
  const KonselingPage({super.key});

  @override
  State<KonselingPage> createState() => _KonselingPageState();

}

class _KonselingPageState extends State<KonselingPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Konseling'),
      ),
      drawer: const DrawerPasien(),
      body: FormKonseling(formKey: _formKey),
    );
  }
}