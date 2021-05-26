import 'package:flutter/material.dart';
import 'package:sepurane_kasir/screens/MenuScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sepurane Resto',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: MyHomePage(),
    );
  }
}

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
            "Sepurane Resto",
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
          children: [
            AppBar(
              title: Text(
                'Sepurane Resto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.addchart_rounded),
              title: Text('Tambah Menu'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Riwayat Transaksi'),
              onTap: () {},
            ),
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
