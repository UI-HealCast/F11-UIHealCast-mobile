import 'package:f11uihealcast/landing/components/drawer_unlogin.dart';
import 'package:f11uihealcast/landing/components/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Pasien'),
      ),
      drawer: const DrawerUnlogin(),
      body: RegisterForm(formKey: _formKey),
    );
  }
}
