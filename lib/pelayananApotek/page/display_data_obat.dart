import 'package:f11uihealcast/pelayananApotek/component/drawer.dart';
import 'package:f11uihealcast/pelayananApotek/api/fetch_data_obat.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class DisplayObatPage extends StatefulWidget {
  const DisplayObatPage({Key? key}) : super(key: key);

  @override
  _DisplayObatState createState() => _DisplayObatState();
}

class _DisplayObatState extends State<DisplayObatPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Data Obat"),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: Obat.fetchObat(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: Text("null"));
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text("Belum ada data obat",
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ListTile(
                                title: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                        "${snapshot.data![index].namaObat}")),
                                Expanded(
                                    child: Text(
                                        "${snapshot.data![index].deskripsi}")),
                                Expanded(
                                    child:
                                        Text("${snapshot.data![index].harga}")),
                                Expanded(
                                    child: Text(snapshot.data![index].statusObat
                                        ? "Tersedia"
                                        : "Tidak tersedia")),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      deleteObat(
                                          request, snapshot.data![index].pk);
                                      setState(() {});
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DisplayObatPage()));
                                    }),
                              ],
                            ))),
                      );
                    },
                  );
                }
              }
            }));
  }
}
