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
        // body: Container(
        //     padding: EdgeInsets.all(10),
        //     margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        //     //alignment: Alignment.topLeft,
        //     decoration: BoxDecoration(
        //       border: Border(
        //         top: BorderSide(width: 1),
        //         bottom: BorderSide(width: 1),
        //       ),
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(
        //           "2021-05-23",
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         Text(
        //           "Rp 12.000",
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        );
  }
}
