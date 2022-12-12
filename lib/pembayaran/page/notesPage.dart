import 'package:f11uihealcast/landing/components/drawer_admin.dart';
import 'package:flutter/material.dart';
import 'package:f11uihealcast/pembayaran/component/notesAdmin.dart';

class NotesAdmin extends StatefulWidget {
  const NotesAdmin({super.key});

  @override
  State<NotesAdmin> createState() => NotesAdminState();
}

class NotesAdminState extends State<NotesAdmin> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan Bulanan'),
      ),
      drawer: const DrawerAdmin(),
      body: FormNotesAdmin(formKey: _formKey),
    );
  }
}