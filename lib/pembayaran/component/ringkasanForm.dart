import 'package:f11uihealcast/landing/components/drawer_pasien.dart';
import 'package:flutter/material.dart';
import 'package:f11uihealcast/pembayaran/api/fetch.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';

class RingkasanForm extends StatefulWidget {
  const RingkasanForm({super.key});

  @override
  State<RingkasanForm> createState() => _RingkasanFormState();
}

class _RingkasanFormState extends State<RingkasanForm> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
        future: fetchNotes(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data.length == 0) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada catatan",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
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
                            children: [Text(snapshot.data![index].fields.bulan)],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [Text(snapshot.data![index].fields.keterangan)],
                          ),
                        ]),
                      ));
            }
          }
        });
  }
}
