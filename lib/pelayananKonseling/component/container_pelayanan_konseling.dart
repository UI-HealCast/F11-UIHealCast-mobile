import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:f11uihealcast/pelayananKonseling/api/api_pelayananKonseling.dart';

class ListPelayananKonseling extends StatefulWidget {
  const ListPelayananKonseling({super.key});

  @override
  State<ListPelayananKonseling> createState() => _ListPelayananKonselingState();
}

class _ListPelayananKonselingState extends State<ListPelayananKonseling> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: fetchKonseling(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data.length == 0) {
            return Column(
              children: const [
                Text(
                  "Tidak ada History Konseling untuk saat ini",
                  style: TextStyle(
                      color: Color.fromARGB(255, 48, 8, 82), fontSize: 40),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_, index) => ListTile(
                  trailing: Checkbox(
                    value: snapshot.data?[index].status_konseling,
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
                        children: [Text("Nama: " + snapshot.data?[index].nama)],
                      ),
                      Row(
                        children: [
                          Text("Status: " + snapshot.data?[index].status_user)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Bentuk Konseling: " +
                              snapshot.data?[index].bentuk_konseling)
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("Keluhan: " +
                              snapshot.data?[index].keluhan_konseling)
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
