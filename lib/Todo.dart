import 'package:flutter/material.dart';

class Todo {
  static List<Todo> todosList = [];

  static const String orderByNewest = 'N';
  static const String orderByOldest = 'O';

  String title;
  String desc;
  DateTime dateCreated;
  String id;

  Todo(this.title, this.desc, this.dateCreated, this.id);

  static void orderTodos(String order) {
    switch (order) {
      case orderByNewest:
        todosList.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
        break;
      case orderByOldest:
        todosList.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
        break;
    }
  }
}

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget(this.todo);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.pushNamed(context, '/view', arguments: todo),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 6, 0, 3),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue[100],
              offset: Offset(2, 3),
            ),
          ],
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            RichText(
              maxLines: 2,
              text: TextSpan(
                text: todo.desc,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              overflow: TextOverflow.fade,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  todo.dateCreated.toIso8601String().substring(0, 10),
                  style: TextStyle(
                    color: Colors.black,
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
