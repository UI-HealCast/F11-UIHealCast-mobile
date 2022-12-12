import 'package:f11uihealcast/pelayananApotek/component/drawer.dart';
import 'package:f11uihealcast/pelayananApotek/api/fetch_data_pasien.dart';
import 'package:flutter/material.dart';

class DisplayStatusObatPage extends StatefulWidget {
  const DisplayStatusObatPage({Key? key}) : super(key: key);

  @override
  _DisplayStatusObatState createState() => _DisplayStatusObatState();
}

class _DisplayStatusObatState extends State<DisplayStatusObatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
          future: Pasien.fetchPasien(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watchlist untuk ditampilkan",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return Card(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  "${snapshot.data![index].fields.username}",
                                  style: const TextStyle(fontSize: 25),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Dokter: ${snapshot.data![index].fields.usernameDokter}",
                                        style: const TextStyle(fontSize: 15),
                                        textAlign: TextAlign.left),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                        // "${snapshot.data![index].fields.statusObat}",
                                        "Obat belum bisa diambil",
                                        style: const TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right),
                                  ),
                                ),
                              ]),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TextButton(
                                child: Text("Ubah Status"),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ]),
                      ));
                    });
              }
            }
          }),
    );
  }
}
