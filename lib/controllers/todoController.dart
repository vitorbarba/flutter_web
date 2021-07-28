// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:todolist/controllers/authController.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/services/database.dart';

class TodoController extends GetxController {
  Rxn<List<TodoModel>> todolist = Rxn<List<TodoModel>>();

  List<TodoModel> get todos => todolist.value!;

  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  void setUser() {
    String uid = Get.find<AuthController>().user!.uid;
    todolist
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }

  void clear() {
    todolist.value = [];
  }
}
