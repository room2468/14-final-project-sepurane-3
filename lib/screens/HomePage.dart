import 'package:flutter/material.dart';
import 'package:sepurane_kasir/screens/AddMenu.dart';
import 'package:sepurane_kasir/screens/CartScreen.dart';
import 'package:sepurane_kasir/screens/LoginPage.dart';
import 'package:sepurane_kasir/screens/MenuScreen.dart';
import 'package:sepurane_kasir/screens/RiwayatTransaksi.dart';
import 'package:sepurane_kasir/services/sign_in.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Cart()));
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 60,
              backgroundColor: Colors.transparent,
            ),
          ),
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
              Get.to(RiwayatTransaksi());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              signOutGoogle();
              Get.offAll(LoginPage());
            },
          ),
          Divider(),
        ],
      )),
      body: MenuScreen(),
    );
  }
}
