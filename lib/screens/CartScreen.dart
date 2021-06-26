import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sepurane_kasir/constants/controllers.dart';
import 'package:sepurane_kasir/controllers/CartController.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';
import 'package:sepurane_kasir/model/CartModel.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartModel cartItem;
  UserController userController = UserController.instance;
  CartController cartController = CartController.instance;
  final TextEditingController bayarController = TextEditingController();
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
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 1, color: Colors.black38))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total : IDR ${cartController.totalCartPrice.value.toStringAsFixed(0)} K",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 40,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      elevation: 2,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pembayaran Berhasil')));
                        paymentsController.createPaymentMethod();
                        cartController.removeCartItem(cartItem);
                      },
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

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartItem({Key key, @required this.cartItem}) : super(key: key);

  final CartModel cartItem;
  CartController cartController = CartController.instance;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem.img,
            width: 100,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  cartItem.name,
                  style: TextStyle(fontSize: 14),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.indeterminate_check_box),
                    onPressed: () {
                      cartController.decreaseQuantity(cartItem);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    cartItem.qty.toStringAsFixed(0),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add_box),
                    onPressed: () {
                      cartController.increaseQuantity(cartItem);
                    }),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "IDR ${cartItem.cost.toStringAsFixed(0)} K",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
