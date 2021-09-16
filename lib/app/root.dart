import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/login_controller.dart';
import 'package:todolist/app/user_controller.dart';
import 'package:todolist/app/home_page.dart';
import 'package:todolist/app/login_page.dart';

// ignore: use_key_in_widget_constructors
class Root extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController(),
      builder: (_) {
        return Visibility(
            visible: controller.user?.uid != null,
            replacement: LoginPage(),
            child: HomePage());
      },
    );
  }
}
