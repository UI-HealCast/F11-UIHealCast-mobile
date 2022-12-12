import 'package:f11uihealcast/pembayaran/api/fetch.dart';
import 'package:f11uihealcast/pembayaran/model/pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final Future<List<Pembayaran>> future = fetchPembayaran();
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: fetchPembayaran(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data.length == 0) {
            return Column(
              children: const [
                Text(
                  "Tidak ada transaksi",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            // ini harus diubah jadi return listview builder
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ListTile(
                  trailing: Checkbox(
                    value: snapshot.data![index].fields.statusBayar,
                    onChanged: (bool? newValue) {},
                  ),
                  title: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 2.0)
                        ]),
                    child: Column(children: [
                      Row(
                        children: [Text(snapshot.data![index].fields.user)],
                      ),
                      Row(
                        children: [
                          Text(snapshot.data![index].fields.tanggalJanji
                              .substring(0, 10))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(snapshot.data![index].fields.statusBayar)
                        ],
                      ),
                    ]),
                  )),
            );
          }
        }
      },
    );
  }
}
