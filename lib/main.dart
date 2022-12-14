import 'package:f11uihealcast/landing/components/drawer_dokter.dart';
import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:f11uihealcast/landing/components/drawer_apoteker.dart';
import 'package:f11uihealcast/landing/components/drawer_unlogin.dart';
import 'package:f11uihealcast/pelayananDokter/page/pelayanan_dokter.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:f11uihealcast/landing/page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
          "/pelayananDokter": (BuildContext context) =>
              const PelayananDokterPage(),
          '/home': (BuildContext context) => const MyHomePage(title: "-"),
        },
        initialRoute: "/home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("UIHealCast"),
      ),
      drawer: widget.title == "-"
          ? const DrawerUnlogin()
          : widget.title == "Dokter"
              ? const DrawerDokter()
              : widget.title == "Apoteker"
                  ? const DrawerApoteker()
                  : const DrawerPasien(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/doktor.jpg',
              height: 400,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Selamat Datang di UI Health Care',
              style:
                  TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Health Care System Terbaik se Depok - Kelapa Dua',
              style:
                  TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
