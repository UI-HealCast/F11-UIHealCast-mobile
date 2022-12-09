import 'package:f11uihealcast/landing/api/landing_api.dart';
import 'package:f11uihealcast/landing/page/feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ListPasien extends StatefulWidget {
  const ListPasien({super.key});

  @override
  State<ListPasien> createState() => _ListPasienState();
}

class _ListPasienState extends State<ListPasien> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: fetchListPasien(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData) {
            return Column(
              children: const [
                Text(
                  "Tidak ada watchlist :(",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FeedBackPage(data: snapshot.data![index])));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2.0)
                      ]),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(snapshot.data![index].username),
                      ],
                    ),
                    Row(
                      children: [
                        Text(snapshot.data![index].tanggalJanji
                            .substring(0, 10)),
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
