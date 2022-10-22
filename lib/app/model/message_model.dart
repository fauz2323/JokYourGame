class MessageModel {
  MessageModel({
    required this.from,
    required this.message,
    required this.status,
  });

  String from;
  String message;
  String status;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        from: json["from"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "message": message,
        "status": status,
      };
}
