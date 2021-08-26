import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:todolist/controllers/authController.dart';
import 'package:todolist/controllers/todoController.dart';
import 'package:todolist/controllers/userController.dart';
import 'package:todolist/services/database.dart';
import 'package:todolist/widgets/todo_card.dart';

// ignore: use_key_in_widget_constructors
class Home extends GetWidget<AuthController> {
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user =
                await Database().getUser(Get.find<AuthController>().user!.uid);
          },
          builder: (_) {
            if (_.user.name != null) {
              return Row(children: [
                IconButton(
                  icon: Icon(
                    GetPlatform.isWeb
                        ? Icons.web
                        : GetPlatform.isMobile
                            ? Icons.phone
                            : GetPlatform.isDesktop
                                ? Icons.desktop_windows
                                : Icons.info_outline,
                  ),
                  onPressed: () {},
                  tooltip: GetPlatform.isWeb
                      ? 'web'
                      : GetPlatform.isMobile
                          ? 'phone'
                          : GetPlatform.isDesktop
                              ? 'desktop'
                              : 'info',
                ),
                Text('Welcome'.tr + ' ' + _.user.name!),
              ]);
            } else {
              return Text('loading...'.tr);
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.changeTheme((Get.isDarkMode || Get.isPlatformDarkMode)
                  ? ThemeData.light()
                  : ThemeData.dark());
            },
          )
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
                        Database().addTodo(
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
                            return TodoCard(
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
