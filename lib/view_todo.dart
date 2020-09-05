import 'package:flutter/material.dart';
import 'package:todo_app/api.dart';
import 'Todo.dart';

class ViewTodo extends StatefulWidget {
  @override
  _ViewTodoState createState() => _ViewTodoState();
}

class _ViewTodoState extends State<ViewTodo> {
  @override
  Widget build(BuildContext context) {
    Todo todo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            padding: EdgeInsets.only(right: 10),
            onSelected: (String action) {
              switch (action) {
                case 'edit':
                  Navigator.pushReplacementNamed(context, '/edit', arguments: todo);
                  break;
                case 'delete':
                  deleteTodo(todo);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => route.willHandlePopInternally);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: RichText(
                  text: TextSpan(
                    text: todo.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: RichText(
              softWrap: true,
              textAlign: TextAlign.start,
              text: TextSpan(
                text: todo.desc,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
