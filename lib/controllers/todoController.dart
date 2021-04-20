import 'package:get/get.dart';
import 'package:vendabalcao/controllers/authController.dart';
import 'package:vendabalcao/models/todo.dart';
import 'package:vendabalcao/services/database.dart';

class TodoController extends GetxController {
  Rxn<List<TodoModel>> todoList = Rxn<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value!;

  @override
  // ignore: must_call_super
  void onInit() {
    String uid = Get.find<AuthController>().user!.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }
}
