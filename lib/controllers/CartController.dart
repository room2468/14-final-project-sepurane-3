import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';
import 'package:sepurane_kasir/model/CartModel.dart';
import 'package:sepurane_kasir/model/MenuModel.dart';
import 'package:sepurane_kasir/model/UserModel.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  UserController userController = UserController.instance;
  RxDouble totalCartPrice = 0.0.obs;
  Logger logger = Logger();

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addMenuToCart(MenuModel menu) {
    try {
      String itemId = Uuid().toString();
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([
          {
            "id": itemId,
            "menuId": menu.id,
            "name": menu.name,
            "img": menu.img,
            "qty": 1,
            "price": menu.price,
            "cost": menu.price
          }
        ])
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartModel cartItem) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      debugPrint(e.message);
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      userModel.cart.forEach((cartItem) {
        totalCartPrice += cartItem.cost;
      });
    }
  }

  bool _isItemAlreadyAdded(MenuModel menu) =>
      userController.userModel.value.cart
          .where((item) => item.menuId == menu.id)
          .isNotEmpty;

  void decreaseQuantity(CartModel item) {
    if (item.qty == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      item.qty--;
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartModel item) {
    removeCartItem(item);
    item.qty++;
    logger.i({"quantity": item.qty});
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
