import 'package:flutter/material.dart';
import 'package:todo_app/Todo.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/api.dart';
import 'homepage.dart';
import 'add_todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getTodos();
  print(Todo.todosList);
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      routes: {
        '/add': (BuildContext context) => new AddTodo()
      },
      home: HomePage(),
    );
  }
}
