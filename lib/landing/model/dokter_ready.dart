class DokterReady {
  DokterReady({
    required this.ready,
  });

  bool ready;

  factory DokterReady.fromJson(Map<String, dynamic> json) => DokterReady(
        ready: json["fields"]["doctorReady"],
      );

  Map<String, dynamic> toJson() => {
        "ready": ready,
      };
}
