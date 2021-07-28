import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/authController.dart';
import 'package:todolist/controllers/userController.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/screens/login.dart';

// ignore: use_key_in_widget_constructors
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
