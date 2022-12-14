import 'dart:convert';
import 'package:http/http.dart' as http;

List<Obat> obatFromJson(String str) =>
    List<Obat>.from(json.decode(str).map((x) => Obat.fromJson(x)));

String obatToJson(List<Obat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Obat {
  Obat({
    // required this.model,
    required this.pk,
    required this.namaObat,
    required this.deskripsi,
    required this.harga,
    required this.statusObat,
    // required this.fields,
  });

  // String model;
  int pk;
  // Fields fields;
  String namaObat;
  String deskripsi;
  int harga;
  bool statusObat;

  factory Obat.fromJson(Map<String, dynamic> json) => Obat(
        //model: json["model"],
        pk: json["pk"],
        namaObat: json["fields"]["nama_obat"],
        deskripsi: json["fields"]["description"],
        harga: json["fields"]["harga"],
        statusObat: json["fields"]["status_obat"],
        //fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        //"model": model,
        "pk": pk,
        "nama_obat": namaObat,
        "description": deskripsi,
        "harga": harga,
        "status_obat": statusObat,
        //"fields": fields.toJson(),
      };

  static Future<List<Obat>> fetchObat() async {
    var url =
        Uri.parse('http://uihealcast.up.railway.app/pelayananApotek/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    // Decoding response menjadi json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Konversi data json menjadi object dari Watchlist
    List<Obat> obats = [];
    for (var elem in data) {
      if (elem != null) {
        obats.add(Obat.fromJson(elem));
      }
    }
    return obats;
  }
}

addObat(request, namaObat, deskripsi, harga) async {
  var response = await request.post(
      'http://uihealcast.up.railway.app/pelayananApotek/add_obat/',
      {'nama_obat': namaObat, 'description': deskripsi, 'harga': harga});
  return response;
}
// updateStatusObat(request, statusObat, pk)

deleteObat(request, pk) async {
  var response = await request.get(
      'http://uihealcast.up.railway.app/pelayananApotek/delete_obat_flutter/${pk}');
  return;
}

editStatusObat(request, pk) async {
  var response = await request.get(
      'http://uihealcast.up.railway.app/pelayananApotek/change_status_obat_flutter/${pk}');
  return response;
}
