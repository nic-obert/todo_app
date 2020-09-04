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
          title: Text(
            'Todo App',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: <Widget>[
            Center(
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pushNamed(context, '/add'),
                child: Text(
                  'Add Todo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                )
              )
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, '/add'),
              iconSize: 35,
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            )
          ],
        ),
        body: SafeArea(
            child: ListView(
          children: <TodoWidget>[for (Todo todo in Todo.todosList) TodoWidget(todo)],
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
        children: <Widget>[
          Text(todo.title),
          Text(todo.desc),
          Text(todo.dateCreated.toIso8601String().substring(0, 10)),
        ],
      ),
    );
  }
}
