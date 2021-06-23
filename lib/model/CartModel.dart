class CartModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "img";
  static const QUANTITY = "qty";
  static const PRICE = "price";
  static const COST = "cost";
  static const MENU_ID = "menuId";

  String id;
  String name;
  String img;
  int qty;
  double price;
  double cost;
  String menuId;

  CartModel(
      {this.menuId,
      this.id,
      this.name,
      this.img,
      this.qty,
      this.price,
      this.cost});

  CartModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    menuId = data[MENU_ID];
    name = data[NAME];
    img = data[IMAGE];
    qty = data[QUANTITY];
    price = data[PRICE].toDouble();
    cost = data[COST].toDouble();
  }

  Map toJson() => {
        ID: id,
        MENU_ID: menuId,
        NAME: name,
        IMAGE: img,
        QUANTITY: qty,
        PRICE: price,
        COST: price * qty,
      };
}
