class AuthModel {
  AuthModel({
    required this.message,
    required this.data,
    required this.name,
  });

  String message;
  String name;
  Data data;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        name: json["name"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.balance,
  });

  int balance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: int.parse(json["balance"]),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}
