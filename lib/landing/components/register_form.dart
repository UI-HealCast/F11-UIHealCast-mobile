import 'package:f11uihealcast/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.formKey});

  final formKey;

  @override
  State<RegisterForm> createState() => _FormRegister();
}

class _FormRegister extends State<RegisterForm> {
  get formKey => widget.formKey;

  String? password;
  String? username;
  String? password1;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
            child: Text("Register"),
          ),
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Username ",
                icon: const Icon(Icons.title),
                // Menambahkan icon agar lebih intuitif
                // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  username = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  username = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong!';
                }
                return null;
              },
            ),
          ),
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),

            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password ",
                icon: const Icon(Icons.password),
                // Menambahkan icon agar lebih intuitif
                // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  password = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  password = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong!';
                }
                return null;
              },
            ),
          ),
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),

            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password Confirmation",
                icon: const Icon(Icons.password),
                // Menambahkan icon agar lebih intuitif
                // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  password1 = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  password1 = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong!';
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
            onPressed: () async {
              final response = await request.post(
                  'http://10.0.2.2:8000/register/', {
                "username": username,
                "password1": password,
                "password2": password1
              });

              if (formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const MyHomePage(title: "-"),
                    ));
              }
            },
          ),
        ]),
      )),
    );
  }
}
