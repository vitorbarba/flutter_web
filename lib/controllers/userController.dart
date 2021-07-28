// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:todolist/models/user.dart';

class UserController extends GetxController {
  late final Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
