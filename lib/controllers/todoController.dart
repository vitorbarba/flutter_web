import 'package:get/get.dart';
import 'package:todoList/controllers/authController.dart';
import 'package:todoList/models/todo.dart';
import 'package:todoList/services/database.dart';

class TodoController extends GetxController {
  Rxn<List<TodoModel>> todoList = Rxn<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value!;

  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  void setUser() {
    String uid = Get.find<AuthController>().user!.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }

  void clear() {
    todoList.value = [];
  }
}
