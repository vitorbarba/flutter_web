import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? content;
  String? id;
  Timestamp? dateCreated;
  bool? done;

  TodoModel({
    this.content,
    this.id,
    this.dateCreated,
    this.done,
  });

  TodoModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    content = documentSnapshot["content"];
    dateCreated = documentSnapshot["dateCreated"];
    done = documentSnapshot["done"];
  }
}
