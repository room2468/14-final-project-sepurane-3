import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sepurane_kasir/constants/controllers.dart';
import 'package:sepurane_kasir/screens/AddMenu.dart';
import 'package:sepurane_kasir/screens/AuthScreen.dart';
import 'package:sepurane_kasir/screens/CartScreen.dart';
import 'package:sepurane_kasir/screens/MenuScreen.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserController userController = UserController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sepurane POS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(Cart());
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Obx(()=>UserAccountsDrawerHeader(
            accountName: Text(userController.userModel.value.name ?? ''),
            accountEmail: Text(userController.userModel.value.email ?? ''),
          )),
          Divider(),
          ListTile(
            leading: Icon(Icons.addchart_rounded),
            title: Text('Tambah Menu'),
            onTap: () {
              Get.to(AddMenu());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat Transaksi'),
            onTap: () {
             paymentsController.getPaymentHistory();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              userController.signOut();
              Get.offAll(AuthScreen());
            },
          ),
          Divider(),
        ],
      )),
      body: MenuScreen(),
    );
  }
}
