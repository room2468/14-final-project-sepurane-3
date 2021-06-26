import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/model/MenuModel.dart';
import 'package:sepurane_kasir/services/firebase.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController img = TextEditingController();
  TextEditingController price = TextEditingController();
  RxList<MenuModel> menu = RxList<MenuModel>([]);
  String collection = "menu";

  @override
  onReady() {
    super.onReady();
    menu.bindStream(getAllMenu());
  }

  Stream<List<MenuModel>> getAllMenu() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => MenuModel.fromMap(item.data())).toList());
}
