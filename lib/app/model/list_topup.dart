class ListTopUpModel {
  ListTopUpModel({
    required this.data,
  });

  List<Datum> data;

  factory ListTopUpModel.fromJson(Map<String, dynamic> json) => ListTopUpModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.idAkun,
    required this.codeUniq,
    required this.total,
    required this.status,
    required this.path,
    required this.ket,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int idAkun;
  String codeUniq;
  String total;
  String status;
  String path;
  String ket;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idAkun: json["id_akun"],
        codeUniq: json["codeUniq"],
        total: json["total"],
        status: json["status"],
        path: json["path"],
        ket: json["ket"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_akun": idAkun,
        "codeUniq": codeUniq,
        "total": total,
        "status": status,
        "path": path,
        "ket": ket,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
