import 'package:f11uihealcast/pelayananDokter/api/api_pelayananDokter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class HistoryLog extends StatelessWidget {
  const HistoryLog({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: fetchLog(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData) {
            return Column(
              children: const [
                Text(
                  "Tidak ada History Layanan :(",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            // ini harus diubah jadi return listview builder
            return Scaffold();
          }
        }
      },
    );
  }
}
