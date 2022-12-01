import 'package:f11uihealcast/landing/components/drawer_dokter.dart';
import 'package:f11uihealcast/landing/components/drawer_unlogin.dart';
import 'package:f11uihealcast/landing/components/form_feedback_dokter.dart';
import 'package:f11uihealcast/landing/model/list_pasien_dokter.dart';
import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key, this.data});

  final PasienDokter? data;
  @override
  State<FeedBackPage> createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedBackPage> {
  final _formKey = GlobalKey<FormState>();

  get data => widget.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pasien'),
      ),
      drawer: const DrawerDokter(),
      body: FormFeedBack(
        formKey: _formKey,
        data: data,
      ),
    );
  }
}
