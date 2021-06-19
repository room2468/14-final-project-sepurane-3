import 'package:flutter/material.dart';

class DetailTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Column(
            children: [
              Text(
                "Detail Transaksi\n2021-05-28",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://awsimages.detik.net.id/community/media/visual/2020/08/18/nasi-goreng-pedas_43.jpeg?w=700&q=90"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          height: 80,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "Nasi Goreng",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "1x",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "Rp 12.000",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              "Total : Rp 12.000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
