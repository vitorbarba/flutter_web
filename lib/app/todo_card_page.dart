import 'package:flutter/material.dart';
import 'package:todolist/app/todo_model.dart';
import 'package:todolist/app/todo_repository.dart';

class TodoCardPage extends StatelessWidget {
  final String? uid;
  final TodoModel? todo;

  const TodoCardPage({Key? key, this.uid, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                todo!.content ?? "",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: todo!.done,
              onChanged: (newValue) {
                todoRepository().updateTodo(newValue!, uid!, todo!.id ?? "");
              },
            ),
            IconButton(
                onPressed: () {
                  todoRepository().removeTodoId(uid!, todo!.id ?? "");
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
