import 'package:get/get.dart';
import 'login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);    
  }
}
