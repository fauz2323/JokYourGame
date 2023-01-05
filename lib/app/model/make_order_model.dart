class MakeOrderModel {
  MakeOrderModel({
    required this.status,
    required this.product,
    required this.orderDetail,
  });

  String status;
  Product product;
  OrderDetail orderDetail;

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) => MakeOrderModel(
        status: json["status"],
        product: Product.fromJson(json["product"]),
        orderDetail: OrderDetail.fromJson(json["orderDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product.toJson(),
        "orderDetail": orderDetail.toJson(),
      };
}

class OrderDetail {
  OrderDetail({
    required this.productId,
    required this.userId,
    required this.note,
    required this.price,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String productId;
  String userId;
  String note;
  String price;
  String status;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        productId: json["product_id"].toString(),
        userId: json["user_id"].toString(),
        note: json["note"],
        price: json["price"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "user_id": userId,
        "note": note,
        "price": price,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
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

  String id;
  String gameId;
  String productName;
  String desc;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"].toString(),
        gameId: json["game_id"].toString(),
        productName: json["productName"],
        desc: json["desc"],
        price: json["price"].toString(),
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
