import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todolist/app/todo_controller.dart';
import 'package:todolist/app/user_controller.dart';
import 'package:todolist/app/user_model.dart';
import 'package:todolist/app/user_repository.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User?> _firebaseUser = Rxn<User>();
  User? get user => _firebaseUser.value;

  @override
  onInit() async {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String? name, String? email, String? password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email!.trim(), password: password!);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );
      if (await userRepository().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        'Error_creating_Account'.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential? _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await userRepository().getUser(_authResult.user!.uid);
      Get.find<TodoController>().setUser();
    } catch (e) {
      Get.snackbar(
        'Error_signing_in'.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.find<TodoController>().clear();
    } catch (e) {
      Get.snackbar(
        'Error_signing_out'.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
