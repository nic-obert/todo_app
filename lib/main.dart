import 'package:flutter/material.dart';
import 'api.dart';
import 'view_todo.dart';
import 'homepage.dart';
import 'add_todo.dart';
import 'edit_todo.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getTodos();
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      routes: {
        '/add': (BuildContext context) => new AddTodo(),
        '/view': (BuildContext context) => new ViewTodo(),
        '/edit': (BuildContext context) => new EditTodo()
      },
      home: HomePage(),
    );
  }
}
