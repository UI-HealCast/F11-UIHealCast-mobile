import 'package:f11uihealcast/landing/model/dokter_ready.dart';
import 'package:f11uihealcast/landing/model/list_pasien_dokter.dart';

register(request, username, password, password1) async {
  final response = await request.post('https://uihealcast.up.railway.app/register/',
      {"username": username, "password": password, "password1": password1});
  return response['status'];
}

logout(request) async {
  var url = 'https://uihealcast.up.railway.app/logout/';
  var response = await request.get(url);

  return true;
}

modifHasil(request, keluhan, pk) async {
  final response = await request.post('https://uihealcast.up.railway.app/modif-hasil/',
      {"hasil": keluhan, "peka": pk.toString()});

  return response["status"];
}

Future<List<PasienDokter>> fetchListPasien(request) async {
  var url = 'https://uihealcast.up.railway.app/list-pasien/';
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

changStatus(request) async {
  var url = 'https://uihealcast.up.railway.app/change-status/';
  var response = await request.get(url);

  return true;
}

Future<List<DokterReady>> fetchDokter(request) async {
  var url = 'https://uihealcast.up.railway.app/show-dokter/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<DokterReady> dataPasien = [];

  for (var d in data) {
    if (d != null) {
      dataPasien.add(DokterReady.fromJson(d));
    }
  }
  return dataPasien;
}
