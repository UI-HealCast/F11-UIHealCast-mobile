import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:f11uihealcast/pelayananDokter/model/doctor_ready.dart';

Future<List<DoctorReady>> fetchDokter() async {
  var url = Uri.parse('http://10.0.2.2:8000/pelayananDokter/show_doc/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<DoctorReady> _dataDokter = [];

  for (var d in data) {
    if (d != null) {
      _dataDokter.add(DoctorReady.fromJson(d));
    }
  }
  return _dataDokter;
}
