import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sepurane_kasir/controllers/CartController.dart';
import 'package:sepurane_kasir/controllers/MenuController.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';
import 'package:sepurane_kasir/screens/AuthScreen.dart';
import 'package:sepurane_kasir/services/firebase.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/AppController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(UserController());
    Get.put(MenuController());
    Get.put(CartController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sepurane POS',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: AuthScreen(),
    );
  }
}
