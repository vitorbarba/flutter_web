import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendabalcao/controllers/authController.dart';
import 'package:vendabalcao/controllers/userController.dart';
import 'package:vendabalcao/screens/home.dart';
import 'package:vendabalcao/screens/login.dart';

class Root extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController(),
      builder: (_) {
        return Visibility(
          visible: controller.user?.uid != null,
          replacement: Login(),
          child: Home());
      },
    );
  }
}
