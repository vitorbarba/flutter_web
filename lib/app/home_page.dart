import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:todolist/app/todo_controller.dart';
import 'package:todolist/app/todo_repository.dart';
import 'package:todolist/app/user_controller.dart';
import 'package:todolist/app/todo_card_page.dart';
import 'package:todolist/app/user_repository.dart';

import 'login_controller.dart';

class HomePage extends GetView<LoginController> {
  final TextEditingController _todoController = TextEditingController();
  final isDarkMode = Get.isDarkMode.obs;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user = await userRepository()
                .getUser(Get.find<LoginController>().user!.uid);
          },
          builder: (_) {
            if (_.user.name != null) {
              return Text('Welcome'.tr + ' ' + _.user.name!);
            } else {
              return Text('loading...'.tr);
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Obx(() =>
                Icon(isDarkMode.value ? Icons.light_mode : Icons.dark_mode)),
            onPressed: () {
              Get.changeThemeMode(Get.theme.brightness == Brightness.dark
                  ? ThemeMode.light
                  : ThemeMode.dark);
              isDarkMode.value = !isDarkMode.value;
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Text(
            'Add_Todo_Here:'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != "") {
                        todoRepository().addTodo(
                            _todoController.text, controller.user!.uid);
                        _todoController.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Text(
            'Your_Todos'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<TodoController>(
              init: Get.put<TodoController>(TodoController()),
              builder: (TodoController todoController) {
                // ignore: unnecessary_null_comparison
                return (!(todoController != null &&
                        todoController.todos.isNotEmpty))
                    ? Expanded(child: Text('loading...'.tr))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: todoController.todos.length,
                          itemBuilder: (_, index) {
                            return TodoCardPage(
                              uid: controller.user!.uid,
                              todo: todoController.todos[index],
                              key: null,
                            );
                          },
                        ),
                      );
              })
        ],
      ),
    );
  }
}
