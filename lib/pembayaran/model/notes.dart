import 'dart:convert';

List<NotesAdmin> notesFromJson(String str) =>
    List<NotesAdmin>.from(json.decode(str).map((x) => NotesAdmin.fromJson(x)));

String notesToJson(List<NotesAdmin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesAdmin {
  NotesAdmin({
    required this.pk,
    required this.bulan,
    required this.keterangan,
  });

  int pk;
  String bulan;
  String keterangan;

  factory NotesAdmin.fromJson(Map<String, dynamic> json) => NotesAdmin(
        pk: json["pk"],
        bulan: json["fields"]["bulan"],
        keterangan: json["fields"]["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "bulan": bulan,
        "keterangan": keterangan,
      };
}
