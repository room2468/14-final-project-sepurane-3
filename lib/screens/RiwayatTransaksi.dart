import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/PaymentsController.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:sepurane_kasir/model/Payments.dart';

// ignore: must_be_immutable
class RiwayatTransaksi extends StatelessWidget {
  PaymentsController paymentsController = PaymentsController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Transaksi"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: paymentsController.payments
                .map((payment) => PaymentWidget(
                      paymentsModel: payment,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  final PaymentsModel paymentsModel;

  const PaymentWidget({Key key, this.paymentsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.5), blurRadius: 15)
          ]),
      child: Wrap(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Total:",
                    style: new TextStyle(
                      fontSize: 18.0,
                    )),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\ IDR ${paymentsModel.amount.toStringAsFixed(0)} K",
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          Divider(),
          Column(
              children: paymentsModel.cart
                  .map((item) => ListTile(
                        title: Text(
                          item['name'] + " x${item['qty'].toStringAsFixed(0)} ",
                        ),
                        trailing: Text(
                          "\IDR ${item['price'].toStringAsFixed(0)} K",
                        ),
                      ))
                  .toList()),
          Divider(),
          ListTile(
            title: Text(
              _returnDate(),
            ),
          )
        ],
      ),
    );
  }

  String _returnDate() {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(paymentsModel.createdAt);
    return timeago.format(date, locale: 'fr');
  }
}
