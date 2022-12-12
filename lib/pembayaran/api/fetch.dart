import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:f11uihealcast/pembayaran/model/pembayaran.dart';
import 'package:f11uihealcast/pembayaran/model/notes.dart';

Future<List<Pembayaran>> fetchPembayaran() async {
  var url = Uri.parse('http://127.0.0.1:8000/pembayaran/json/');
  var response = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  });

  // var data = response;
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Pembayaran> dataPembayaran = [];
  for (var d in data) {
    if (d != null) {
      dataPembayaran.add(Pembayaran.fromJson(d));
    }
  }
  return dataPembayaran;
}

addNotes(request, bulan, keterangan) async {
  var response = await request.post(
      'http://127.0.0.1:8000/pembayaran/keterangan/add/',
      {"bulan": bulan, "keterangan": keterangan});
  return response['status'];
}

Future<List<NotesAdmin>> fetchNotes(id) async {
  var url = Uri.parse('http://127.0.0.1:8000/pembayaran/keterangan/json/');
  var response = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  });

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<NotesAdmin> catatan = [];
  for (var d in data) {
    if (d != null) {
      catatan.add(NotesAdmin.fromJson(d));
    }
  }
  return catatan;
}
