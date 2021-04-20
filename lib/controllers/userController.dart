import 'package:get/get.dart';
import 'package:vendabalcao/models/user.dart';

class UserController extends GetxController {
  late Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
