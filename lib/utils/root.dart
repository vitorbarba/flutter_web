import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoList/controllers/authController.dart';
import 'package:todoList/controllers/userController.dart';
import 'package:todoList/screens/home.dart';
import 'package:todoList/screens/login.dart';

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
