import 'package:f11uihealcast/pembayaran/api/fetch.dart';
import 'package:f11uihealcast/pembayaran/model/pembayaran.dart';
import 'package:f11uihealcast/pembayaran/page/ringkasanNotes.dart';
import 'package:f11uihealcast/pembayaran/model/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormNotesAdmin extends StatefulWidget {
  const FormNotesAdmin({super.key, this.formKey});

  final formKey;

  @override
  State<FormNotesAdmin> createState() => _FormNotesAdmin();
}

class _FormNotesAdmin extends State<FormNotesAdmin> {
  get formKey => widget.formKey;

  String? pilihBulan;
  String? keterangan;

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
        future: fetchNotes(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada catatan",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        value: pilihBulan,
                        hint: const Text("Pilih bulan"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'Januari',
                            child: Text('Januari'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Februari',
                            child: Text('Februari'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Maret',
                            child: Text('Maret'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'April',
                            child: Text('April'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Mei',
                            child: Text('Mei'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Juni',
                            child: Text('Juni'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Juli',
                            child: Text('Juli'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Agustus',
                            child: Text('Agustus'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'September',
                            child: Text('September'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Oktober',
                            child: Text('Oktober'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'November',
                            child: Text('November'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Desember',
                            child: Text('Desember'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            pilihBulan = value ?? "";
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: Total biaya operasi 150 mio",
                          labelText: "Keterangan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            keterangan = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            keterangan = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong!';
                          }
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
                          addNotes(request, pilihBulan, keterangan);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ringkasan()),
                          );
                        }
                      },
                    )
                  ]),
                )),
              );
            }
          }
        });
  }
}
