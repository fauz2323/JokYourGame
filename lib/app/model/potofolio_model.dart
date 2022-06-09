class PortofolioModel {
  PortofolioModel({
    required this.data,
    required this.porto,
  });

  String data;
  List<Porto> porto;

  factory PortofolioModel.fromJson(Map<String, dynamic> json) =>
      PortofolioModel(
        data: json["data"],
        porto: List<Porto>.from(json["porto"].map((x) => Porto.fromJson(x))),
      );
}

class Porto {
  Porto({
    required this.path,
  });

  String path;

  factory Porto.fromJson(Map<String, dynamic> json) => Porto(
        path: json["path"],
      );
}
