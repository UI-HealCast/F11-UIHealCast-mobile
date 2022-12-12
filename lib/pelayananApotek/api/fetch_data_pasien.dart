import 'dart:convert';
import 'package:http/http.dart' as http;

List<Pasien> pasienFromJson(String str) =>
    List<Pasien>.from(json.decode(str).map((x) => Pasien.fromJson(x)));

String pasienToJson(List<Pasien> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pasien {
  Pasien({
    //required this.model,
    required this.pk,
    required this.username,
    required this.usernameDokter,
    required this.statusObat,
    //required this.fields,
  });

  //String model;
  int pk;
  //Fields fields;
  String username;
  String usernameDokter;
  bool statusObat;

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        //model: json["model"],
        pk: json["pk"],
        username: json["fields"]["username"],
        usernameDokter: json["fields"]["usernameDokter"],
        statusObat: json["fields"]["statusObat"],
        //fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username,
        "usernameDokter": usernameDokter,
        "statusObat": statusObat,
      };

  static Future<List<Pasien>> fetchPasien() async {
    var url =
        Uri.parse('http://localhost:8000/pelayananApotek/show_patient_json');
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
    List<Pasien> pasiens = [];
    for (var elem in data) {
      if (elem != null) {
        pasiens.add(Pasien.fromJson(elem));
      }
    }
    return pasiens;
  }
}

editStatusObatPasien(request, pk) async {
  var response = await request.get(
      'http://localhost:8000/pelayananApotek/change_status_pasien_flutter/${pk}');
  return response;
}
// class Fields {
//   Fields({
//     required this.username,
//     required this.usernameDokter,
//     required this.statusObat,
//   });

//   String username;
//   String usernameDokter;
//   bool statusObat;

//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         username: json["username"],
//         usernameDokter: json["usernameDokter"],
//         statusObat: json["statusObat"],
//       );
//   Map<String, dynamic> toJson() => {
//         "username": username,
//         "usernameDokter": usernameDokter,
//         "statusObat": statusObat,
//       };
// }
