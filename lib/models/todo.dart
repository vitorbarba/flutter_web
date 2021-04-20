import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String content;
  late String todoId;
  late Timestamp dateCreated;
  late bool done;

  TodoModel(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  TodoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    todoId = documentSnapshot.id;
    content = documentSnapshot["content"];
    dateCreated = documentSnapshot["dateCreated"];
    done = documentSnapshot["done"];
  }
}
