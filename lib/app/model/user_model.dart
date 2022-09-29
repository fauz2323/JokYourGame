class UserDataModel {
  UserDataModel({
    required this.message,
    required this.userData,
    required this.balance,
  });

  String message;
  num balance;
  UserData userData;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        message: json["message"],
        balance: num.parse(json['balance']),
        userData: UserData.fromJson(json["userData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userData": userData.toJson(),
      };
}

class UserData {
  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String username;
  String email;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
