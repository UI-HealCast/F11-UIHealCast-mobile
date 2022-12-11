import 'package:f11uihealcast/pelayananKonseling/model/konseling.dart';

Future<List<ShowKonseling>> fetchKonseling(request) async {
  var url =
      'https://uihealcast.up.railway.app/pelayananKonseling/show_json_konseling/';
  var response = await request.get(url);

  var data = response;

  List<ShowKonseling> log = [];

  for (var d in data) {
    if (d != null) {
      log.add(ShowKonseling.fromJson(d));
    }
  }
  return log;
}

addKonseling(request, nama, status_user, email, bentuk_konseling, keluhan_konseling, senin, selasa, rabu, kamis, jumat, sabtu, minggu, pagi, siang, sore, malam) async {
  var response = await request.post(
      'https://uihealcast.up.railway.app/pelayananKonseling/tembakDBAjax/',
      {"nama": nama, "status_user": status_user, "email": email, "bentuk_konseling": bentuk_konseling, "keluhan_konseling": keluhan_konseling, "senin": senin, "selasa": selasa, "rabu": rabu, "kamis": kamis, "jumat": jumat, "sabtu": sabtu, "minggu": minggu, "pagi": pagi, "siang": siang, "sore": sore, "malam": malam});
  return response['status'];
}
