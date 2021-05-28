import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sepurane_kasir/model/MenuModel.dart';
import 'package:sepurane_kasir/main.dart';

class AddMenu extends StatefulWidget {  
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  MenuModel menu;

  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    if (menu != null) {
      nameController.text = menu.name;
      priceController.text = menu.price.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Menu'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));
            },
          ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          autovalidate: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget> [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.restaurant_menu_rounded),
                  helperText: 'masukkan menu',
                  labelText: 'Menu'
                ),
                keyboardType: TextInputType.name,
                validator: (menuvalue) {
                  if (menuvalue.isEmpty) {
                    return 'silakan isi menu';
                  }
                  return null;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.attach_money),
                  helperText: 'masukkan harga',
                  labelText: 'Harga',
                ),
                keyboardType: TextInputType.number,
                //onFieldSubmitted: (), 
                  //(pricevalue) {
                  //setState(() {
                  //  menu.price = pricevalue as int;
                  //});
                  //},  
                validator: (pricevalue) {
                  if (pricevalue.isEmpty) {
                    return 'silakan isi harga';
                  }
                  return null;
                },
              ),

              RaisedButton(
                color: Theme.of(context).primaryColorLight,
                textColor: Theme.of(context).primaryColorDark,
                child: Text(
                  'Add Menu',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  if (menu == null) {
                    menu = MenuModel(nameController.text, int.parse(priceController.text));
                  } else {
                    menu.name = nameController.text;
                    menu.price = int.parse(priceController.text);
                  }

                  Navigator.pop(context, menu);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}