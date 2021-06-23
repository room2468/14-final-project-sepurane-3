import 'package:flutter/material.dart';
import 'package:sepurane_kasir/controllers/CartController.dart';
import 'package:sepurane_kasir/model/CartModel.dart';

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
                    cartItem.qty.toString(),
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
            "Rp ${cartItem.cost}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
