class GameListModelNew {
  GameListModelNew({
    required this.game,
    required this.list,
  });

  String game;
  List<ListElement> list;

  factory GameListModelNew.fromJson(Map<String, dynamic> json) =>
      GameListModelNew(
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
    required this.image,
  });

  String id;
  String gameId;
  String productName;
  String desc;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  List<Image> image;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"].toString(),
        gameId: json["game_id"].toString(),
        productName: json["productName"],
        desc: json["desc"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_id": gameId,
        "productName": productName,
        "desc": desc,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.id,
    required this.idProduct,
    required this.path,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String idProduct;
  String path;
  DateTime createdAt;
  DateTime updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"].toString(),
        idProduct: json["id_product"],
        path: json["path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_product": idProduct,
        "path": path,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
