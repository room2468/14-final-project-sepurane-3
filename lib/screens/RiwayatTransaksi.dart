import 'package:flutter/material.dart';
import 'package:sepurane_kasir/main.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Riwayat Transaksi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));
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
              ),
            )
          ],
        )
        );
  }
}
