import 'package:f11uihealcast/pelayananApotek/component/drawer.dart';
import 'package:f11uihealcast/pelayananApotek/api/fetch_data_obat.dart';
import 'package:flutter/material.dart';

class DisplayObatPage extends StatefulWidget {
  const DisplayObatPage({Key? key}) : super(key: key);

  @override
  _DisplayObatState createState() => _DisplayObatState();
}

class _DisplayObatState extends State<DisplayObatPage> {
  @override
  Widget build(BuildContext context) {
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
                                    child: Text(
                                        "${snapshot.data![index].statusObat}")),
                              ],
                            ))),
                      );
                    },
                  );
                  // return Container(
                  //         padding: const EdgeInsets.all(5),
                  // child: DataTable(
                  //   columns: const [
                  //     DataColumn(
                  //         label: Text(
                  //       "Nama Obat",
                  //       style: TextStyle(
                  //           fontSize: 25, fontWeight: FontWeight.bold),
                  //     )),
                  //     DataColumn(
                  //         label: Text(
                  //       "Deskripsi Obat",
                  //       style: TextStyle(
                  //           fontSize: 25, fontWeight: FontWeight.bold),
                  //     )),
                  //     DataColumn(
                  //         label: Text(
                  //       "Harga",
                  //       style: TextStyle(
                  //           fontSize: 25, fontWeight: FontWeight.bold),
                  //     )),
                  //     DataColumn(
                  //         label: Text(
                  //       "Status",
                  //       style: TextStyle(
                  //           fontSize: 25, fontWeight: FontWeight.bold),
                  //     )),
                  //   ],
                  //   rows: ListView.builder(
                  //     itemCount: snapshot.data!.length,
                  //     itemBuilder: (_, index) =>
                  //     DataRow(cells: [
                  //       DataCell(Text(
                  //           "${snapshot.data![index].fields.namaObat}"))
                  //     ]),
                  //     DataRow(cells: [
                  //       DataCell(Text(
                  //           "${snapshot.data![index].fields.deskripsi}"))
                  //     ]),
                  //     DataRow(cells: [
                  //       DataCell(
                  //           Text("${snapshot.data![index].fields.harga}"))
                  //     ]),
                  //     DataRow(cells: [
                  //       DataCell(Text(
                  //           "${snapshot.data![index].fields.statusObat}"))
                  //     ]),
                  //   ]));
                  //   },
                  // );
                }
              }
            }));
  }
}
