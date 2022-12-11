import 'package:f11uihealcast/landing/model/list_pasien_dokter.dart';

register(request, username, password, password1) async {
  final response = await request.post('http://localhost:8000/register/',
      {"username": username, "password": password, "password1": password1});
  return response['status'];
}

logout(request) async {
  var url = 'http://localhost:8000/logout/';
  var response = await request.get(url);

  return true;
}

modifHasil(request, keluhan, pk) async {
  final response = await request.post('http://localhost:8000/modif-hasil/',
      {"hasil": keluhan, "peka": pk.toString()});

  return response["status"];
}

Future<List<PasienDokter>> fetchListPasien(request) async {
  var url = 'http://localhost:8000/list-pasien/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<PasienDokter> dataPasien = [];

  for (var d in data) {
    if (d != null) {
      dataPasien.add(PasienDokter.fromJson(d));
    }
  }
  return dataPasien;
}
