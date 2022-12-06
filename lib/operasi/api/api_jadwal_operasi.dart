import 'package:f11uihealcast/operasi/model/jadwal_operasi.dart';
import 'package:f11uihealcast/operasi/model/pasien.dart';

Future<List<JadwalOperasi>> fetchOperasi(request) async {
  var url = 'http://localhost:8000/operasi/json/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<JadwalOperasi> jadwalOperasi = [];

  for (var d in data) {
    if (d != null) {
      jadwalOperasi.add(JadwalOperasi.fromJson(d));
    }
  }
  return jadwalOperasi;
}

Future<List<Pasien>> fetchPasien(request) async {
  var url = 'http://localhost:8000/operasi/pasien/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<Pasien> listPasien = [];

  for (var d in data) {
    if (d != null) {
      listPasien.add(Pasien.fromJson(d));
    }
  }
  return listPasien;
}

addOperasi(request, pasien, tanggal, jam, keterangan) async {
  var response = await request.post('http://localhost:8000/operasi/add/',
      {"pasien": pasien, "tanggal": tanggal, "jam": jam, "keterangan": keterangan});
  return response['status'];
}

