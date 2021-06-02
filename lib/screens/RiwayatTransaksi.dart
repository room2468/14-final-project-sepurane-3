import 'package:flutter/material.dart';
import 'package:sepurane_kasir/main.dart';
import 'package:sepurane_kasir/screens/DetailTransaksi.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Transaksi"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => MyApp()));
          },
        ),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.date_range_rounded),
              ),
              title: Text(
                "2021-05-28",
              ),
              subtitle: Text("Total : Rp 12.000"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => DetailTransaksi()));
              },
            ),
          )
        ],
      ),
    );
  }
}
