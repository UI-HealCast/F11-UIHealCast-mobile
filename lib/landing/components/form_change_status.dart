import 'package:f11uihealcast/landing/api/landing_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormChangeStatus extends StatefulWidget {
  const FormChangeStatus({super.key});

  @override
  State<FormChangeStatus> createState() => _ChangeState();
}

class _ChangeState extends State<FormChangeStatus> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: fetchDokter(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData) {
            return Column(
              children: const [
                Text(
                  "Tidak ada Dokter :(",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    changStatus(request);
                  });
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: snapshot.data![index].ready
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2.0)
                      ]),
                  child: Column(children: [
                    Row(
                      children: [
                        snapshot.data![index].ready
                            ? const Text(
                                "Status Dokter : Tersedia",
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                "Status Dokter : Tidak Tersedia",
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ]),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
