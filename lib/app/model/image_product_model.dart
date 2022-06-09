class ImageProductModel {
  ImageProductModel({
    required this.data,
    required this.image,
  });

  String data;
  List<Image> image;

  factory ImageProductModel.fromJson(Map<String, dynamic> json) =>
      ImageProductModel(
        data: json["data"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
      );
}

class Image {
  Image({
    required this.path,
  });

  String path;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        path: json["path"],
      );
}
