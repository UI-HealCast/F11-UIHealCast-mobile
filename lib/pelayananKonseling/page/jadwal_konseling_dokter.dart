import 'package:f11uihealcast/landing/components/drawer_dokter.dart';
import 'package:flutter/material.dart';
import 'package:f11uihealcast/pelayananKonseling/api/api_pelayananKonseling.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';

class ListKonselingDokter extends StatefulWidget {
  const ListKonselingDokter({super.key});

  @override
  State<ListKonselingDokter> createState() => _ListKonselingDokter();
}

class _ListKonselingDokter extends State<ListKonselingDokter> {
  refreshList() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Konseling'),
      ),
      drawer: const DrawerDokter(),
      body: FutureBuilder(
        future: fetchKonselingDokter(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data.length == 0) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada jadwal konseling!",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2.0)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Nama Pasien: ",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          Text(
                            snapshot.data[index].nama,
                            style: const TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "Status Pasien: ",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          Text(
                            snapshot.data[index].status_user,
                            style: const TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "Bentuk Konseling: ",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          Text(
                            snapshot.data[index].bentuk_konseling,
                            style: const TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "Keluhan: ",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          Text(
                            snapshot.data[index].keluhan_konseling,
                            style: const TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "Status Konseling: ",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          Text(
                            snapshot.data[index].status_konseling
                                ? "Selesai"
                                : "Belum Selesai",
                            style: const TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "Opsi: ",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                              child: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              deleteKonseling(
                                  request, snapshot.data![index].pk);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListKonselingDokter()),
                              );
                            },
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
