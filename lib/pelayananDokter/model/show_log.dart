class ShowLog {
  ShowLog(
      {required this.pk,
      required this.keluhan,
      required this.tanggalJanji,
      required this.noHP,
      required this.status,
      required this.usernameDokter});

  int pk = 0;
  String keluhan = "";
  String tanggalJanji;
  bool status;
  String usernameDokter;
  String noHP;

  factory ShowLog.fromJson(Map<String, dynamic> json) => ShowLog(
        pk: json["pk"],
        keluhan: json["fields"]["keluhan"],
        tanggalJanji: json["fields"]["tanggal_anji"],
        noHP: json["fields"]["noHP"],
        status: json["fields"]["status"],
        usernameDokter: json["fields"]["usernameDokter"],
      );

  Map<String, dynamic> toJson() => {
        "keluhan": keluhan,
        "pk": pk,
        "status": status,
        "tanggalJanji": tanggalJanji,
        "noHP": noHP,
        "usernameDokter": usernameDokter,
      };
}
