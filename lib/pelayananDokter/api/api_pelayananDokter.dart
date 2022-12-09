import 'package:f11uihealcast/pelayananDokter/model/doctor_ready.dart';
import 'package:f11uihealcast/pelayananDokter/model/show_log.dart';

Future<List<DoctorReady>> fetchDokter(request) async {
  var url = 'http://10.0.2.2:8000/pelayananDokter/show_doc/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<DoctorReady> dataDokter = [];

  for (var d in data) {
    if (d != null) {
      dataDokter.add(DoctorReady.fromJson(d));
    }
  }
  return dataDokter;
}

addJanji(request, keluhan, noHP, dokter) async {
  var response = await request.post('http://10.0.2.2:8000/pelayananDokter/add/',
      {"keluhan": keluhan, "noHP": noHP, "dokter": dokter});
  return response['status'];
}

Future<List<ShowLog>> fetchLog(request) async {
  var url = 'http://10.0.2.2:8000/pelayananDokter/show_log/';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<ShowLog> log = [];

  for (var d in data) {
    if (d != null) {
      log.add(ShowLog.fromJson(d));
    }
  }
  return log;
}
