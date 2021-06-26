import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/MenuController.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();

  CollectionReference _menu = FirebaseFirestore.instance.collection('menu');

  MenuController menuController = MenuController.instance;

  Future<void> _createOrUpdate([DocumentSnapshot documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _idController.text = documentSnapshot['id'];
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
      _imgController.text = documentSnapshot['img'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.format_list_numbered),
                      helperText: 'Masukkan Kode Menu',
                      labelText: 'Kode Menu'),
                  controller: _idController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (menuvalue) {
                    if (menuvalue.isEmpty) {
                      return 'Silakan isi kode menu';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.restaurant_menu_rounded),
                      helperText: 'Masukkan menu',
                      labelText: 'Menu'),
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: (menuvalue) {
                    if (menuvalue.isEmpty) {
                      return 'Silakan isi menu';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.attach_money),
                    helperText: 'Masukkan harga',
                    labelText: 'Harga',
                  ),
                  validator: (pricevalue) {
                    if (pricevalue.isEmpty) {
                      return 'Silakan isi harga';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _imgController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.image),
                    helperText: 'Masukkan link gambar',
                    labelText: 'Gambar',
                  ),
                  validator: (pricevalue) {
                    if (pricevalue.isEmpty) {
                      return 'Silakan isi link gambar';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String id = _idController.text;
                    final String name = _nameController.text;
                    final double price = double.tryParse(_priceController.text);
                    final String img = _imgController.text;
                    if (id != null && name != null && price != null && img != null ) {
                      if (action == 'create') {
                        await _menu
                            .add({"id": id, "name": name, "price": price, "img": img});
                      }

                      if (action == 'update') {
                        await _menu
                            .doc(documentSnapshot.id)
                            .update({"id": id, "name": name, "price": price, "img": img});
                      }
                      _idController.text = '';
                      _nameController.text = '';
                      _priceController.text = '';
                      _imgController.text = '';
                      Get.back();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _deleteProduct(String productId) async {
    await _menu.doc(productId).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Menu berhasil dihapus')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Menu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Get.back();
          },
        ),
      ),
      body: StreamBuilder(
        stream: _menu.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(documentSnapshot['img']),
                    ),
                    title: Text(documentSnapshot['name']),
                    subtitle: Text("IDR"+documentSnapshot['price'].toStringAsFixed(0) +" K"),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: Icon(Icons.add),
      ),
    );
  }
}
