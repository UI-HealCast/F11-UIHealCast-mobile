import 'package:f11uihealcast/landing/components/drawer_apoteker.dart';
import 'package:f11uihealcast/pelayananApotek/api/fetch_data_obat.dart';
import 'package:f11uihealcast/pelayananApotek/page/display_data_obat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormObatPage extends StatefulWidget {
  const FormObatPage({super.key});
  @override
  State<FormObatPage> createState() => _FormObatState();
}

class _FormObatState extends State<FormObatPage> {
  final _formKey = GlobalKey<FormState>();

  String? namaObat;
  String? deskripsi;
  String? harga;

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Obat'),
        ),
        drawer: const DrawerApoteker(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                // input nama obat
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nama Obat",
                      hintText: "Contoh: Panadol",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // onChanged: (String? value) {
                    //   setState(() {
                    //     namaObat = value!;
                    //   });
                    // },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        namaObat = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama obat tidak boleh kosong!';
                      }
                      namaObat = value;
                      return null;
                    },
                  ),
                ),
                // input deskripsi obat
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Deskripsi Obat",
                      hintText: "Contoh: Paracetamol",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // onChanged: (String? value) {
                    //   setState(() {
                    //     namaObat = value!;
                    //   });
                    // },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        namaObat = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong!';
                      }
                      deskripsi = value;
                      return null;
                    },
                  ),
                ),
                // input harga obat
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Harga",
                      hintText: "Contoh: 10000",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // onChanged: (String? value) {
                    //   setState(() {
                    //     harga = int.parse(value!);
                    //   });
                    // },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        harga = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama obat tidak boleh kosong!';
                      }
                      if (!isNumeric(value)) {
                        return 'Harga harus berupa angka!';
                      }
                      harga = value;
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
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 203, 59)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addObat(request, namaObat, deskripsi, harga);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DisplayObatPage()));
                    }
                  },
                ),
              ]),
            ))));
  }
}
