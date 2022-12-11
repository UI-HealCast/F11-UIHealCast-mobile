import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:f11uihealcast/pelayananKonseling/api/api_pelayananKonseling.dart';
import 'package:f11uihealcast/pelayananKonseling/page/pelayanan_konseling.dart';

class FormKonseling extends StatefulWidget {
  const FormKonseling({super.key, this.formKey});

  final formKey;

  @override
  State<FormKonseling> createState() => _FormKonselingState();
}

class _FormKonselingState extends State<FormKonseling> {
  get formKey => widget.formKey;

  String? nama;
  String? status_user;
  String? email;
  String? bentuk_konseling;
  String? keluhan_konseling;
  bool? senin = false;
  bool? selasa = false;
  bool? rabu = false;
  bool? kamis = false;
  bool? jumat = false;
  bool? sabtu = false;
  bool? minggu = false;
  bool? pagi = false;
  bool? siang = false;
  bool? sore = false;
  bool? malam = false;
  String? noHP;

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  List<String> _statusUser = [
    'Mahasiswa UI',
    'Pegawai UI',
    'Others',
  ];

  List<String> _bentukKonseling = [
    'Offline',
    'Online via chat',
    'Online via video call',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Konseling'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    nama = value;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Status User',
                  ),
                  value: status_user,
                  items: _statusUser.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      status_user = value.toString();
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status User tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Bentuk Konseling',
                  ),
                  value: bentuk_konseling,
                  items: _bentukKonseling.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      bentuk_konseling = value.toString();
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bentuk Konseling tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Keluhan Konseling',
                  ),
                  onChanged: (value) {
                    keluhan_konseling = value;
                  },
                ),
                const SizedBox(height: 16),
                Text('Preferensi Hari Konseling'),
                Row(
                  children: [
                    Checkbox(
                      value: senin,
                      onChanged: (value) {
                        setState(() {
                          senin = value;
                        });
                      },
                    ),
                    const Text('Senin'),
                    Checkbox(
                      value: selasa,
                      onChanged: (value) {
                        setState(() {
                          selasa = value;
                        });
                      },
                    ),
                    const Text('Selasa'),
                    Checkbox(
                      value: rabu,
                      onChanged: (value) {
                        setState(() {
                          rabu = value;
                        });
                      },
                    ),
                    const Text('Rabu'),
                    Checkbox(
                      value: kamis,
                      onChanged: (value) {
                        setState(() {
                          kamis = value;
                        });
                      },
                    ),
                    const Text('Kamis'),
                    Checkbox(
                      value: jumat,
                      onChanged: (value) {
                        setState(() {
                          jumat = value;
                        });
                      },
                    ),
                    const Text('Jumat'),
                    Checkbox(
                      value: sabtu,
                      onChanged: (value) {
                        setState(() {
                          sabtu = value;
                        });
                      },
                    ),
                    const Text('Sabtu'),
                    Checkbox(
                      value: minggu,
                      onChanged: (value) {
                        setState(() {
                          minggu = value;
                        });
                      },
                    ),
                    const Text('Minggu'),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Preferensi Waktu Konseling'),
                Row(
                  children: [
                    Checkbox(
                      value: pagi,
                      onChanged: (value) {
                        setState(() {
                          pagi = value;
                        });
                      },
                    ),
                    const Text('Pagi'),
                    Checkbox(
                      value: siang,
                      onChanged: (value) {
                        setState(() {
                          siang = value;
                        });
                      },
                    ),
                    const Text('Siang'),
                    Checkbox(
                      value: sore,
                      onChanged: (value) {
                        setState(() {
                          sore = value;
                        });
                      },
                    ),
                    const Text('Sore'),
                    Checkbox(
                      value: malam,
                      onChanged: (value) {
                        setState(() {
                          malam = value;
                        });
                      },
                    ),
                    const Text('Malam'),
                  ],
                ),
                const SizedBox(height: 16),
                TextButton(
                  child: const Text('Submit'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      addKonseling(request, nama, status_user, email, bentuk_konseling, keluhan_konseling, senin, selasa, rabu, kamis, jumat, sabtu, minggu, pagi, siang, sore, malam);
                      Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder: (context) => KonselingPage(),
                      ));
                    }
                  },
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}

        





  
