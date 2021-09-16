import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:todolist/app/login_controller.dart';

// ignore: use_key_in_widget_constructors
class UserPage extends GetWidget<LoginController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'.tr),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Full_Name'.tr),
                controller: nameController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'.tr),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'.tr),
                obscureText: true,
                controller: passwordController,
              ),
              TextButton(
                  onPressed: () {
                    controller.createUser(nameController.text,
                        emailController.text, passwordController.text);
                  },
                  child: Text('Sign_Up'.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
