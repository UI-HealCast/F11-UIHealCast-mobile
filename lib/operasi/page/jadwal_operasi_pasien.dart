import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:flutter/material.dart';
import 'package:f11uihealcast/operasi/api/api_jadwal_operasi.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';

class JadwalOperasiPasien extends StatefulWidget {
    const JadwalOperasiPasien({super.key});

    @override
    State<JadwalOperasiPasien> createState() => _JadwalOperasiPasien();
}

class _JadwalOperasiPasien extends State<JadwalOperasiPasien> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Operasi'),
      ),
      drawer: const DrawerPasien(),
      body: FutureBuilder(
        future: fetchOperasi(request),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data.length == 0) {
                  return Column(
                  children: const [
                      Text(
                      "Tidak ada jadwal operasi!",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                      ),
                      SizedBox(height: 8),
                  ],
                  );
              } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                        )
                        ]
                    ),
                    child: 
                      ExpandablePanel(
                        header: Text(
                                "${snapshot.data![index].usernameDokter}",
                                style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                        collapsed: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: [
                                const Text(
                                  "Jam: ",
                                  style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                                Text(
                                  "${snapshot.data![index].jam}",
                                  style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),]
                              ),
                              Row(children: [
                                const Text(
                                  "Tanggal: ",
                                  style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                                Text(
                                  "${snapshot.data![index].tanggal}",
                                  style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),]
                              ),
                            ],
                          ),
                        expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: [
                                const Text(
                                  "Jam: ",
                                  style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                                Text(
                                  "${snapshot.data![index].jam}",
                                  style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),]
                              ),
                              Row(children: [
                                const Text(
                                  "Tanggal: ",
                                  style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                                Text(
                                  "${snapshot.data![index].tanggal}",
                                  style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),]
                              ),
                              const Text(
                                  "Keterangan: ",
                                  style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                              Text(
                                  "${snapshot.data![index].keterangan}",
                                  style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                            ],
                          ),
                      ),
                ));
              }
            }
        }
    )
    );
  }
}