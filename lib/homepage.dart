import 'package:flutter/material.dart';
import 'package:todo_app/Todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: null)],
        ),
        body: SafeArea(
            child: ListView(
          children: <TodoWidget>[for (Todo todo in todosList) TodoWidget(todo)],
        )));
  }
}

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget(this.todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Text('title'), Text('description')],
      ),
    );
  }
}
