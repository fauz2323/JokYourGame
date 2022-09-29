class OrderRecipeModel {
  OrderRecipeModel({
    required this.status,
    required this.orderList,
  });

  String status;
  OrderList orderList;

  factory OrderRecipeModel.fromJson(Map<String, dynamic> json) =>
      OrderRecipeModel(
        status: json["status"],
        orderList: OrderList.fromJson(json["orderList"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "orderList": orderList.toJson(),
      };
}

class OrderList {
  OrderList({
    required this.id,
    required this.productId,
    required this.userId,
    required this.note,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.product,
  });

  int id;
  int productId;
  int userId;
  String note;
  int price;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  Product product;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        id: json["id"],
        productId: int.parse(json["product_id"]),
        userId: json["user_id"],
        note: json["note"],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "note": note,
        "price": price,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "product": product.toJson(),
      };
}

class Product {
  Product({
    required this.id,
    required this.gameId,
    required this.productName,
    required this.desc,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int gameId;
  String productName;
  String desc;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        gameId: json["game_id"],
        productName: json["productName"],
        desc: json["desc"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_id": gameId,
        "productName": productName,
        "desc": desc,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });

  int id;
  String username;
  String email;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
      };
}
