import 'package:flutter/material.dart';
import 'package:todo_app/Todo.dart';
import 'package:todo_app/api.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  todosList = await getTodos();
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: HomePage(),
    );
  }
}
