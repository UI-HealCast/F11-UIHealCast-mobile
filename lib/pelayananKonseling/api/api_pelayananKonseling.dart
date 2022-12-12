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

addKonseling(request, nama, status_user, noHP, email, bentuk_konseling, keluhan_konseling, senin, selasa, rabu, kamis, jumat, sabtu, minggu, pagi, siang, sore, malam) async {
  senin = senin ? "true" : "false";
  selasa = selasa ? "true" : "false";
  rabu = rabu ? "true" : "false";
  kamis = kamis ? "true" : "false";
  jumat = jumat ? "true" : "false";
  sabtu = sabtu ? "true" : "false";
  minggu = minggu ? "true" : "false";
  pagi = pagi ? "true" : "false";
  siang = siang ? "true" : "false";
  sore = sore ? "true" : "false";
  malam = malam ? "true" : "false";
  // parse int to string
  noHP = noHP.toString();
  
  var response = await request.post(
      'https://uihealcast.up.railway.app/pelayananKonseling/tembakDBAjax/',
      {"nama": nama, "status_user": status_user, "email": email, "noHP": noHP, "bentuk_konseling": bentuk_konseling, "keluhan_konseling": keluhan_konseling, "senin": senin, "selasa": selasa, "rabu": rabu, "kamis": kamis, "jumat": jumat, "sabtu": sabtu, "minggu": minggu, "pagi": pagi, "siang": siang, "sore": sore, "malam": malam});
  return response['status'];
}

deleteKonseling(request, pk) async {
  var response = await request.get(
      'https://uihealcast.up.railway.app/menu-pasien/delete/$pk');
  return;
}

Future<List<ShowKonseling>> fetchKonselingDokter(request) async {
  var url =
      'https://uihealcast.up.railway.app/show_json_konseling_dokter/';
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

ubahStatusKonseling(request, pk) async {
  var response = await request
      .get('https://uihealcast.up.railway.app/menu-pasien/set-konseling/$pk');
  return;
}
