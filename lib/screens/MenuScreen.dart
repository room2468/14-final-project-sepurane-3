import 'package:flutter/material.dart';
import 'package:sepurane_kasir/model/MenuModel.dart';

// ignore: must_be_immutable
class MenuScreen extends StatelessWidget {
  List<MenuModel> menu = [
    MenuModel("Nasi Goreng", 12000),
    MenuModel("Bakmi Goreng", 12000),
    MenuModel("Bakmi Godog", 12000),
    MenuModel("Fuyung Hai", 15000),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: menu.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 20),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: new NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2020/08/18/nasi-goreng-pedas_43.jpeg?w=700&q=90"),
                    fit: BoxFit.fill)),
            child: Container(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      menu[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        background: Paint()
                          ..color = Colors.black.withOpacity(0.4),
                      ),
                    ),
                    subtitle: Text(
                      'Rp.${menu[index].price}',
                      style: TextStyle(
                          color: Colors.white,
                          background: Paint()
                            ..color = Colors.black.withOpacity(0.4)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(130, 35, 10, 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
