import 'dart:convert';

List<Pembayaran> pembayaranFromJson(String str) =>
    List<Pembayaran>.from(json.decode(str).map((x) => Pembayaran.fromJson(x)));

String pembayaranToJson(List<Pembayaran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pembayaran {
  Pembayaran({
    required this.model,
    required this.pk,
    required this.user,
    required this.noHP,
    required this.keluhan,
    required this.hasilPeriksa,
    required this.tanggalJanji,
    required this.statusBayar,
  });

  String model;
  int pk;
  String user;
  String noHP;
  String keluhan;
  String hasilPeriksa;
  DateTime tanggalJanji;
  bool statusBayar;

  factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
        model: json["model"],
        pk: json["pk"],
        user: json["fields"]["user"],
        noHP: json["fields"]["noHP"],
        keluhan: json["fields"]["keluhan"],
        hasilPeriksa: json["fields"]["hasilPeriksa"],
        tanggalJanji: DateTime.parse(json["tanggal_janji"]),
        statusBayar: json["fields"]["statusBayar"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "user": user,
        "noHP": noHP,
        "keluhan": keluhan,
        "tanggal_janji": tanggalJanji.toIso8601String(),
        "hasilPeriksa": hasilPeriksa,
        "statusBayar": statusBayar,
      };
}
