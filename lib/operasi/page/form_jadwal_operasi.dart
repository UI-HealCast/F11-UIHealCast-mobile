import 'package:f11uihealcast/landing/components/drawer_dokter.dart';
import 'package:f11uihealcast/operasi/model/pasien.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:f11uihealcast/operasi/api/api_jadwal_operasi.dart';

class FormJadwalOperasi extends StatefulWidget {
  const FormJadwalOperasi({super.key});

  @override
  State<FormJadwalOperasi> createState() => _FormJadwalOperasi();
}

class _FormJadwalOperasi extends State<FormJadwalOperasi> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();

  String? pasien;
  DateTime? tanggal;
  TimeOfDay? jam;
  String? keterangan;

  List<Pasien>? listPasien;

  @overridegit 
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
                title: const Text('Buat Jadwal Operasi'),
            ),
      drawer: const DrawerDokter(),
      body: FutureBuilder(
        future: fetchPasien(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada pasien!",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              listPasien = snapshot.data;
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: DropdownButtonFormField<String>(
                          value: pasien,
                          hint: const Text("Pilih pasien"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listPasien!.map((Pasien items) {
                            return DropdownMenuItem(
                              value: items.username,
                              child: Text(items.username),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              pasien = value; 
                            });
                          },
                          validator: (value) => value == null ? 'Pasien tidak boleh kosong!' : null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child:TextFormField(
                          controller: dateinput, //editing controller of this TextField
                          decoration: const InputDecoration( 
                            icon: Icon(Icons.calendar_month), //icon of text field
                            labelText: "Masukkan tanggal operasi" //label text of field
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100)
                            );
                            
                            if(pickedDate != null ){
                                tanggal = pickedDate;
                                String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";  
                                setState(() {
                                  dateinput.text = formattedDate; //set output date to TextField value. 
                                });
                            }else{
                                dateinput.text = "-";
                            }
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty || value == "-") {
                              return 'Tanggal tidak boleh kosong!';
                            }
                            return null;
                          },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child:TextFormField(
                          controller: timeinput, //editing controller of this TextField
                          decoration: const InputDecoration( 
                            icon: Icon(Icons.access_time), //icon of text field
                            labelText: "Masukkan waktu operasi" //label text of field
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now()
                              );
                            
                            if(pickedTime != null ){
                                jam = pickedTime;
                                String formattedTime = "${pickedTime.hour}:${pickedTime.minute}"; 
                                setState(() {
                                  timeinput.text = formattedTime; //set output date to TextField value. 
                                });
                            }else{
                                timeinput.text = "-";
                            }
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty || value == "-") {
                              return 'Waktu tidak boleh kosong!';
                            }
                            return null;
                          },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,//Normal textInputField will be displayed
                        maxLines: 5,// when user presses enter it will adapt to it
                        decoration: InputDecoration(
                          hintText: "Masukkan Keterangan",
                          labelText: "Keterangan",
                          icon: const Icon(Icons.notes),
                          // Menambahkan icon agar lebih intuitif
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          setState(() {
                            keterangan = value;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Keterangan tidak boleh kosong!';
                          }
                          keterangan = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addOperasi(request, pasien, tanggal, jam, keterangan);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FormJadwalOperasi()),
                          );
                        }
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
                )),
              );
            }
          }
        })
    );
    
  }
}
