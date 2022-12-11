
class ShowKonseling {
  ShowKonseling(
      // {required this.pk,
      // required this.keluhan,
      // required this.tanggalJanji,
      // required this.noHP,
      // required this.status,
      // required this.usernameDokter});
      {
    required this.pk,
    required this.nama,
    required this.status_user,
    required this.noHP,
    required this.email,
    required this.bentuk_konseling,
    required this.keluhan_konseling,
    required this.status_konseling,
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat,
    required this.sabtu,
    required this.minggu,
    required this.pagi,
    required this.siang,
    required this.sore,
    required this.malam,
  });

  int pk = 0;
  // String keluhan = "";
  // String tanggalJanji;
  // bool status;
  // String usernameDokter;
  // String noHP;
  String nama = "";
  String status_user = "";
  String noHP = "";
  String email = "";
  String bentuk_konseling = "";
  String keluhan_konseling = "";
  bool status_konseling = false;
  bool senin = false;
  bool selasa = false;
  bool rabu = false;
  bool kamis = false;
  bool jumat = false;
  bool sabtu = false;
  bool minggu = false;
  bool pagi = false;
  bool siang = false;
  bool sore = false;
  bool malam = false;

  factory ShowKonseling.fromJson(Map<String, dynamic> json) => ShowKonseling(
        pk: json["pk"],
        nama: json["fields"]["nama"],
        status_user: json["fields"]["status_user"],
        // parse to String
        noHP: json["fields"]["noHP"].toString(),
        email: json["fields"]["email"],
        bentuk_konseling: json["fields"]["bentuk_konseling"],
        keluhan_konseling: json["fields"]["keluhan_konseling"],
        status_konseling: json["fields"]["status_konseling"],
        senin: json["fields"]["senin"],
        selasa: json["fields"]["selasa"],
        rabu: json["fields"]["rabu"],
        kamis: json["fields"]["kamis"],
        jumat: json["fields"]["jumat"],
        sabtu: json["fields"]["sabtu"],
        minggu: json["fields"]["minggu"],
        pagi: json["fields"]["pagi"],
        siang: json["fields"]["siang"],
        sore: json["fields"]["sore"],
        malam: json["fields"]["malam"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "nama": nama,
        "status_user": status_user,
        "noHP": noHP,
        "email": email,
        "bentuk_konseling": bentuk_konseling,
        "keluhan_konseling": keluhan_konseling,
        "status_konseling": status_konseling,
        "senin": senin,
        "selasa": selasa,
        "rabu": rabu,
        "kamis": kamis,
        "jumat": jumat,
        "sabtu": sabtu,
        "minggu": minggu,
        "pagi": pagi,
        "siang": siang,
        "sore": sore,
        "malam": malam,

        // "status": status,
        // "tanggalJanji": tanggalJanji,
        // "noHP": noHP,
        // "usernameDokter": usernameDokter,
      };
}
