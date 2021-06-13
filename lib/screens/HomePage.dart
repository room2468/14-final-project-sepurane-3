import 'package:flutter/material.dart';
import 'package:sepurane_kasir/screens/AddMenu.dart';
import 'package:sepurane_kasir/screens/LoginPage.dart';
import 'package:sepurane_kasir/screens/MenuScreen.dart';
import 'package:sepurane_kasir/screens/RiwayatTransaksi.dart';
import 'package:sepurane_kasir/services/sign_in.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sepurane POS",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
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
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddMenu(),
                ));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Riwayat Transaksi'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => RiwayatTransaksi()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                signOutGoogle();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
            Divider(),
          ],
        )),
        body: TabBarView(
          children: <Widget>[
            MenuScreen(),
            Text("Checkout"),
          ],
        ),
      ),
    );
  }
}