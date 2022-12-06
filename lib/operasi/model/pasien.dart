// To parse this JSON data, do
//
//     final pasien = pasienFromJson(jsonString);

import 'dart:convert';

List<Pasien> pasienFromJson(String str) => List<Pasien>.from(json.decode(str).map((x) => Pasien.fromJson(x)));

String pasienToJson(List<Pasien> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pasien {
    Pasien({
        required this.model,
        required this.pk,
        required this.user,
        required this.isPatient,
        required this.isDoctor,
        required this.isApotek,
        required this.isAdmin,
        required this.doctorReady,
        required this.username,
    });

    String model;
    int pk;
    int user;
    bool isPatient;
    bool isDoctor;
    bool isApotek;
    bool isAdmin;
    bool doctorReady;
    String username;

    factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        model: json["model"],
        pk: json["pk"],
        user: json["fields"]["user"],
        isPatient: json["fields"]["is_patient"],
        isDoctor: json["fields"]["is_doctor"],
        isApotek: json["fields"]["is_apotek"],
        isAdmin: json["fields"]["is_admin"],
        doctorReady: json["fields"]["doctorReady"],
        username: json["fields"]["username"],
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "user": user,
        "is_patient": isPatient,
        "is_doctor": isDoctor,
        "is_apotek": isApotek,
        "is_admin": isAdmin,
        "doctorReady": doctorReady,
        "username": username,
    };
}