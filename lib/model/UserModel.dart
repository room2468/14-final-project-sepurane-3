import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sepurane_kasir/model/CartModel.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";

  String id;
  String name;
  String email;
  List<CartModel> cart = <CartModel>[];

  UserModel({this.id, this.name, this.email, this.cart});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot[ID];
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    cart = _convertCartItems(snapshot[CART] ?? []);
  }

  List<CartModel> _convertCartItems(List cartFromDb) {
    List<CartModel> _result = [];
    if (cartFromDb.length > 0) {
      cartFromDb.forEach((element) {
        _result.add(CartModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}
