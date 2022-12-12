import 'package:f11uihealcast/pelayananApotek/component/drawer.dart';
import 'package:f11uihealcast/pelayananApotek/component/form_obat.dart';
import 'package:flutter/material.dart';

class HomePageApotek extends StatelessWidget {
  const HomePageApotek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // app bar
        appBar: AppBar(
          title: Text("Pelayanan Apotek"),
        ),
        // drawer
        drawer: buildDrawer(context),
        // body page
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Apotek',
            ),
            Image.asset(
              'assets/apotek.png',
              height: 350,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text("Tambah Obat"),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormObatPage()),
                    );
                  },
                ),
                TextButton(
                  child: Text("Update Data Obat"),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text("Update Status Pasien"),
                  onPressed: () {
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const ))
                  },
                ),
              ],
            )
          ],
        )));
  }
}
// class HomePageApotek extends StatefulWidget {
//   const HomePageApotek({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // app bar
//       appBar: AppBar(
//         title: Text("Pelayanan Apotek"),
//       ),
//       // drawer
//       drawer: buildDrawer(context),
//       // body page
//       body: Center(
//         child:
//       )
//     );
//   }
// }
