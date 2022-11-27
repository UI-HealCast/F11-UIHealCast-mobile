import 'package:f11uihealcast/pelayananDokter/api/get_doctor_ready.dart';
import 'package:f11uihealcast/pelayananDokter/model/doctor_ready.dart';
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: DropdownButton<DoctorReady>(
                          value: snapshot.data[0]!,
                          hint: const Text("Pilih Jenis"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: snapshot.data
                              .map<DropdownMenuItem<DoctorReady>>(
                                  (DoctorReady value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.username),
                            );
                          }).toList(),
                          onChanged: (DoctorReady? value) {
                            setState(() {
                              if (value?.username == null) {
                                _selectDokter = "";
                              } else {
                                _selectDokter = value?.username;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                )),
              );
            }
          }
        });
  }
}
