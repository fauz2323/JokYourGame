class MessageModel {
  MessageModel({
    required this.id,
    required this.userId,
    required this.from,
    required this.message,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String from;
  String message;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        userId: int.parse(json["user_id"]),
        from: json["from"],
        message: json["message"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "from": from,
        "message": message,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
