import 'package:f11uihealcast/pelayananDokter/api/get_doctor_ready.dart';
import 'package:f11uihealcast/pelayananDokter/model/doctor_ready.dart';
import 'package:f11uihealcast/pelayananDokter/page/pelayanan_dokter.dart';
import 'package:flutter/material.dart';

class FormPelayananDokter extends StatefulWidget {
  const FormPelayananDokter({super.key, this.formKey});

  final formKey;

  @override
  State<FormPelayananDokter> createState() => _FormPelayananDokter();
}

class _FormPelayananDokter extends State<FormPelayananDokter> {
  get formKey => widget.formKey;

  String? _selectDokter;
  String? keluhan;
  String? noHP;
  DoctorReady? tempDokter;

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  List<DoctorReady>? isReady;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchDokter(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada watchlist :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              isReady = snapshot.data;
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Center(
                      child: TextFormField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: "Masukkan Keluhan Anda...",
                          labelText: "Keluhan",
                          icon: const Icon(Icons.title),
                          // Menambahkan icon agar lebih intuitif
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          setState(() {
                            keluhan = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          keluhan = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Masukkan Nomor Telepom",
                          labelText: "No. HP",
                          icon: const Icon(Icons.phone),
                          // Menambahkan icon agar lebih intuitif
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            noHP = value;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          if (!isNumeric(value)) {
                            return 'Nominal harus berupa angka!';
                          }
                          noHP = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: DropdownButton<String>(
                          value: _selectDokter,
                          hint: const Text("Pilih Jenis"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: isReady!.map<DropdownMenuItem<String>>(
                              (DoctorReady value) {
                            return DropdownMenuItem(
                              value: value.pk.toString(),
                              child: Text(value.username),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              if (value == null) {
                                _selectDokter = "";
                              } else {
                                _selectDokter = value;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      child: const Text(
                        "Buat Janji",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(keluhan);
                          print(_selectDokter);
                          print(noHP);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PelayananDokterPage()),
                          );
                        }
                        ;
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
