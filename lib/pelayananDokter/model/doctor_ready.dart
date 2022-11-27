class DoctorReady {
  DoctorReady({
    required this.pk,
    required this.username,
  });

  int pk = 0;
  String username = "";

  factory DoctorReady.fromJson(Map<String, dynamic> json) => DoctorReady(
        pk: json["pk"],
        username: json["fields"]["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "pk": pk,
      };
}
