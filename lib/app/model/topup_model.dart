class TopUpModel {
  TopUpModel({
    required this.data,
  });

  Data data;

  factory TopUpModel.fromJson(Map<String, dynamic> json) => TopUpModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.idAkun,
    required this.codeUniq,
    required this.total,
    required this.ket,
    required this.status,
    required this.path,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  int idAkun;
  int codeUniq;
  String total;
  String ket;
  String status;
  String path;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idAkun: json["id_akun"],
        codeUniq: json["codeUniq"],
        total: json["total"],
        ket: json["ket"],
        status: json["status"],
        path: json["path"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id_akun": idAkun,
        "codeUniq": codeUniq,
        "total": total,
        "ket": ket,
        "status": status,
        "path": path,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
