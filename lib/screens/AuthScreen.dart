import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/AppController.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  final AppController _appController = Get.find();
  UserController userController = UserController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width / 4),
              Image.asset(
                "images/firebase_logo.png",
                width: 150,
              ),
              Text(
                "Sepurane POS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: MediaQuery.of(context).size.width / 5),
              Visibility(
                visible: _appController.isLoginWidgetDisplayed.value,
                child: Container(
                  child: Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextField(
                                controller: userController.email,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.email),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Email"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextField(
                                obscureText: true,
                                controller: userController.password,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Password"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: GestureDetector(
                          onTap: () {
                            userController.signIn();
                          },
                          child: PhysicalModel(
                            color: Colors.grey.withOpacity(.4),
                            elevation: 2,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              child: Container(
                                margin: EdgeInsets.all(14),
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !_appController.isLoginWidgetDisplayed.value,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextField(
                                controller: userController.name,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.person),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Nama"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextField(
                                controller: userController.email,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.email),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Email"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextField(
                                obscureText: true,
                                controller: userController.password,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Password"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: GestureDetector(
                          onTap: () {
                            userController.signUp();
                          },
                          child: PhysicalModel(
                            color: Colors.grey.withOpacity(.4),
                            elevation: 2,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              child: Container(
                                margin: EdgeInsets.all(14),
                                alignment: Alignment.center,
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                  visible: _appController.isLoginWidgetDisplayed.value,
                  child: GestureDetector(
                    onTap: () {
                      _appController.changeDIsplayedAuthWidget();
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Tidak memiliki akun?",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: " Buat akun",
                          style: TextStyle(color: Colors.blue))
                    ])),
                  )),
              Visibility(
                visible: !_appController.isLoginWidgetDisplayed.value,
                child: GestureDetector(
                  onTap: () {
                    _appController.changeDIsplayedAuthWidget();
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Sudah memiliki akun?",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: " Sign in",
                            style: TextStyle(color: Colors.blue))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
