import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendabalcao/controllers/authController.dart';
import 'package:vendabalcao/controllers/userController.dart';
import 'package:vendabalcao/screens/home.dart';
import 'package:vendabalcao/screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        print("UserController");
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        print("root");
        // ignore: unnecessary_null_comparison
        if (Get.find<AuthController>().user!.uid != null) {
          print("Home");
          return Home();
        } else {
          print("Login");
          return Login();
        }
      },
    );
  }
}
