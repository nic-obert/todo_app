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
          PopupMenuButton<String>(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.sort,
              color: Colors.white,
              size: 30,
            ),
            onSelected: (String order) {
              setState(() {
                Todo.orderTodos(order);
              });
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: Todo.orderByNewest,
                  child: Text('newest'),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: Todo.orderByOldest,
                  child: Text('oldest'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Flexible(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <TodoWidget>[
              for (Todo todo in Todo.todosList) TodoWidget(todo),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        backgroundColor: Colors.blue[500],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
