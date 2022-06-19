class OrderListModel {
  OrderListModel({
    required this.status,
    required this.orderList,
  });

  String status;
  List<OrderList> orderList;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        status: json["status"],
        orderList: List<OrderList>.from(
            json["orderList"].map((x) => OrderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "orderList": List<dynamic>.from(orderList.map((x) => x.toJson())),
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
    required this.product,
    required this.review,
  });

  int id;
  int productId;
  int userId;
  String note;
  String review;
  int price;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        note: json["note"],
        review: json['review'],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
