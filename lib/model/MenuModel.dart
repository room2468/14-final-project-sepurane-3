class MenuModel {
  static const ID = "id";
  static const IMAGE = "img";
  static const NAME = "name";
  static const PRICE = "price";

  String id;
  String img;
  String name;
  double price;

  MenuModel({this.id, this.img, this.name, this.price});

  MenuModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    img = data[IMAGE];
    name = data[NAME];
    price = data[PRICE].toDouble();
  }
}
