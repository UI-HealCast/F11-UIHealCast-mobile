import 'package:f11uihealcast/landing/api/landing_api.dart';
import 'package:f11uihealcast/landing/model/list_pasien_dokter.dart';
import 'package:f11uihealcast/landing/page/list_pasien.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormFeedBack extends StatefulWidget {
  const FormFeedBack({super.key, this.data, this.formKey});

  final PasienDokter? data;
  final formKey;

  @override
  State<FormFeedBack> createState() => _FeedbackState();
}

class _FeedbackState extends State<FormFeedBack> {
  get formKey => widget.formKey;
  get data => widget.data;

  String? keluhanMasuk;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.username),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.keluhan),
            ),
            Padding(
              // Menggunakan padding sebesar 8 pixels
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Feedback Dokter ",
                  icon: const Icon(Icons.feedback),
                  // Menambahkan icon agar lebih intuitif
                  // Menambahkan circular border agar lebih rapi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                  setState(() {
                    keluhanMasuk = value!;
                  });
                },
                // Validator sebagai validasi form
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Feedback tidak boleh kosong!';
                  }
                  keluhanMasuk = value;
                  return null;
                },
              ),
            ),
            TextButton(
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  modifHasil(request, keluhanMasuk, data.pk);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListPasienPage()),
                  );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
