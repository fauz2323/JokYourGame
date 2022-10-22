class ReviewModel {
  ReviewModel({
    required this.status,
    required this.review,
  });

  String status;
  List<Review> review;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        status: json["status"],
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.userId,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int orderId;
  int productId;
  int userId;
  String review;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        orderId: int.parse(json["order_id"]),
        productId: int.parse(json["product_id"]),
        userId: json["user_id"],
        review: json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "user_id": userId,
        "review": review,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String username;
  String email;
  String password;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
