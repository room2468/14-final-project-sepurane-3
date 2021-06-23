import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/MenuController.dart';
import 'package:sepurane_kasir/model/MenuModel.dart';

// ignore: must_be_immutable
class MenuScreen extends StatelessWidget {
  final MenuModel menuItem;
  MenuController menuController = MenuController.instance;

  MenuScreen({Key key, this.menuItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .95,
        padding: const EdgeInsets.all(10),
        children: menuController.menu.map((MenuModel menuItem) {
          return Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: new NetworkImage(menuItem.img), fit: BoxFit.fill)),
              child: Container(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        menuItem.name,
                        style: TextStyle(
                          color: Colors.white,
                          background: Paint()
                            ..color = Colors.black.withOpacity(0.4),
                        ),
                      ),
                      subtitle: Text(
                        menuItem.price.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            background: Paint()
                              ..color = Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(130, 70, 10, 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList()));
  }
}
