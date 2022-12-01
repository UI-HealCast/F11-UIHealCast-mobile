class PasienDokter {
  PasienDokter({
    required this.pk,
    required this.keluhan,
    required this.tanggalJanji,
    required this.username,
  });

  int pk = 0;
  String keluhan = "";
  String? username;
  String? tanggalJanji;

  factory PasienDokter.fromJson(Map<String, dynamic> json) => PasienDokter(
        pk: json["pk"],
        keluhan: json["fields"]["keluhan"],
        tanggalJanji: json["fields"]["tanggal_janji"],
        username: json["fields"]["username"],
      );

  Map<String, dynamic> toJson() => {
        "keluhan": keluhan,
        "pk": pk,
        "username": username,
        "tanggalJanji": tanggalJanji,
      };
}
