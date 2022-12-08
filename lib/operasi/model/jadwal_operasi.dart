// To parse this JSON data, do
//
//     final jadwalOperasi = jadwalOperasiFromJson(jsonString);

import 'dart:convert';

List<JadwalOperasi> jadwalOperasiFromJson(String str) => List<JadwalOperasi>.from(json.decode(str).map((x) => JadwalOperasi.fromJson(x)));

String jadwalOperasiToJson(List<JadwalOperasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JadwalOperasi {
    JadwalOperasi({
        required this.model,
        required this.pk,
        required this.dokter,
        required this.usernameDokter,
        required this.pasien,
        required this.usernamePasien,
        required this.tanggal,
        required this.jam,
        required this.keterangan,
    });

    String model;
    int pk;
    int dokter;
    String usernameDokter;
    int pasien;
    String usernamePasien;
    String tanggal;
    String jam;
    String keterangan;


    factory JadwalOperasi.fromJson(Map<String, dynamic> json) => JadwalOperasi(
        model: json["model"],
        pk: json["pk"],
        dokter: json["fields"]["dokter"],
        usernameDokter: json["fields"]["usernameDokter"],
        pasien: json["fields"]["pasien"],
        usernamePasien: json["fields"]["usernamePasien"],
        tanggal: json["fields"]["tanggal"] as String,
        jam: json["fields"]["jam"],
        keterangan: json["fields"]["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "dokter": dokter,
        "usernameDokter": usernameDokter,
        "pasien": pasien,
        "usernamePasien": usernamePasien,
        "tanggal": tanggal,
        "jam": jam,
        "keterangan": keterangan,
    };
}