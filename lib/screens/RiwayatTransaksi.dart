import 'package:flutter/material.dart';
import 'package:sepurane_kasir/screens/DetailTransaksi.dart';
import 'package:sepurane_kasir/screens/HomePage.dart';
import 'package:get/get.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Transaksi"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(
                MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
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
               Get.to(DetailTransaksi());
              },
            ),
          )
        ],
      ),
    );
  }
}
