import 'package:get/get.dart';
import 'package:todolist/app/login_controller.dart';
import 'package:todolist/app/todo_model.dart';
import 'package:todolist/app/todo_repository.dart';

class TodoController extends GetxController {
  Rxn<List<TodoModel>> todolist = Rxn<List<TodoModel>>();

  List<TodoModel> get todos => todolist.value!;

  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  void setUser() {
    String uid = Get.find<LoginController>().user!.uid;
    todolist
        .bindStream(todoRepository().todoStream(uid)); //stream coming from firebase
  }

  void clear() {
    todolist.value = [];
  }
}
