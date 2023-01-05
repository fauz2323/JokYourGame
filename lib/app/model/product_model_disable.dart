class ProductModel {
  ProductModel({
    required this.game,
    required this.list,
  });

  String game;
  List<ListElement> list;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        game: json["game"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "game": game,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"].toString(),
        gameId: json["game_id"].toString(),
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
