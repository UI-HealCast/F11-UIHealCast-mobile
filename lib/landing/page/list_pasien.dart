import 'package:f11uihealcast/landing/components/container_list_pasien.dart';
import 'package:f11uihealcast/landing/components/drawer_dokter.dart';
import 'package:f11uihealcast/landing/components/form_change_status.dart';
import 'package:flutter/material.dart';

class ListPasienPage extends StatefulWidget {
  const ListPasienPage({super.key});

  @override
  State<ListPasienPage> createState() => _ListPasienState();
}

class _ListPasienState extends State<ListPasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Pasien'),
      ),
      drawer: const DrawerDokter(),
      body: Column(
        children: [
          const FormChangeStatus(),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          Flexible(
            child: const ListPasien(),
          ),
        ],
      ),
    );
  }
}
