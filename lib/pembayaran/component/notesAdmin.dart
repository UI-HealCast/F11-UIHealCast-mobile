import 'package:f11uihealcast/pembayaran/api/fetch.dart';
import 'package:f11uihealcast/pembayaran/model/pembayaran.dart';
import 'package:f11uihealcast/pembayaran/page/ringkasanNotes.dart';
import 'package:f11uihealcast/pembayaran/model/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormNotesAdmin extends StatefulWidget {
  const FormNotesAdmin({super.key, this.formKey});
  // final NotesBayar myNotes;

  final formKey;

  @override
  State<FormNotesAdmin> createState() => _FormNotesAdmin();
}

class _FormNotesAdmin extends State<FormNotesAdmin> {
  final formKey = GlobalKey<FormState>();

  // get formKey => widget.formKey;

  String pilihBulan = "";
  List<String> listBulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  String keterangan = "";

  // void _initSubmitComment(request) async {
  //   final response = await request.post(
  //       "https://uihealcast.up.railway.app/pembayaran/keterangan/add/${widget.myForum.pk}/",
  //       {
  //         'bulan': bulan,
  //         'keterangan': keterangan,
  //       }).then((value) {
  //     final newValue = new Map<String, dynamic>.from(value);
  //     print(newValue['status'].toString());
  //     setState(() {
  //       if (newValue['status'].toString() == "success") {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text("Success add comment!"),
  //           backgroundColor: Colors.indigo,
  //         ));
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => ForumPostDetail(myForum: widget.myForum)),
  //         );
  //       } else
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text("Failed add comment"),
  //           backgroundColor: Colors.redAccent,
  //         ));
  //     });
  //   });
  // }

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
                    // Expanded(
                    //     child: Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       if (formKey.currentState!.validate()) {
                    //         NotesAdmin.addNotes(
                    //           judul: _judul,
                    //           nominal: _nominal,
                    //           tipe: _tipe,
                    //           date: _date,
                    //         );
                    //         showDialog(
                    //           context: context,
                    //           builder: (context) {
                    //             return Dialog(
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10),
                    //               ),
                    //               elevation: 15,
                    //               child: ListView(
                    //                 padding: const EdgeInsets.symmetric(
                    //                   horizontal: 20.0,
                    //                   vertical: 16.0,
                    //                 ),
                    //                 shrinkWrap: true,
                    //                 children: [
                    //                   Center(
                    //                     child: Text(
                    //                       "Berhasil menambahkan $_tipe $_judul sebesar ${_nominal.toString()}\n",
                    //                       textAlign: TextAlign.center,
                    //                     ),
                    //                   ),
                    //                   TextButton(
                    //                     onPressed: () {
                    //                       Navigator.pop(context);
                    //                     },
                    //                     child: const Text('Kembali'),
                    //                   )
                    //                 ],
                    //               ),
                    //             );
                    //           },
                    //         );
                    //         _formKey.currentState!.reset();
                    //       }
                    //     },
                    //     style: ButtonStyle(
                    //       padding: MaterialStateProperty.all(
                    //           const EdgeInsets.all(12.0)),
                    //       backgroundColor:
                    //           MaterialStateProperty.all(Colors.blue),
                    //     ),
                    //     child: const Text(
                    //       "Simpan",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ))
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
