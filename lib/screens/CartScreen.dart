import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/CartController.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';
import 'package:sepurane_kasir/widgets/CartItem.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  UserController userController = UserController.instance;
  CartController cartController = CartController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: userController.userModel.value.cart
                        ?.map((cartItem) => CartItem(
                              cartItem: cartItem,
                            ))
                        ?.toList() ??
                    [],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
              decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black38))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total : Rp ${cartController.totalCartPrice.value.toString()}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 40,
                    child: RaisedButton(
                      elevation: 2,
                      onPressed: () {},
                      textColor: Colors.black,
                      color: Colors.yellow,
                      child: Text("Bayar", style: TextStyle(fontSize: 15)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
