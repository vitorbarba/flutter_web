import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/login_controller.dart';
import 'package:todolist/app/user_page.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends GetWidget<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'.tr),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'.tr),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'.tr),
                controller: passwordController,
                obscureText: true,
              ),
              TextButton(
                child: Text('LoginPage'.tr),
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
              ),
              TextButton(
                child: Text('Account'.tr),
                onPressed: () {
                  Get.to(UserPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
