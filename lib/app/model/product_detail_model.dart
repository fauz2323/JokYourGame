class ProductDetailModel {
  ProductDetailModel({
    required this.data,
    required this.game,
  });

  Data data;
  String game;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        data: Data.fromJson(json["data"]),
        game: json['game'],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "game": game,
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
