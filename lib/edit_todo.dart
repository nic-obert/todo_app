import 'package:flutter/material.dart';
import 'Todo.dart';
import 'api.dart';

class EditTodo extends StatefulWidget {
  @override
  _EditTodoState createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void buildTodo(Todo old) {

    old.title = titleController.text;
    old.desc = descController.text;

    editTodo(old);

  }

  @override
  Widget build(BuildContext context) {

    Todo todo = ModalRoute.of(context).settings.arguments;
    titleController.text = todo.title;
    descController.text = todo.desc;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 4,
              child: TextFormField(
                maxLengthEnforced: true,
                maxLength: 32,
                maxLines: 1,
                controller: titleController,
                validator: (value) => value.isEmpty ? 'Todos must have a title' : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Todo\'s title',
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 6,
              child: TextFormField(
                maxLengthEnforced: true,
                maxLength: 1024,
                maxLines: 10,
                minLines: 5,
                controller: descController,
                validator: (value) => value.isEmpty ? 'Todos must have a description' : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Todo\'s description',
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.blue[500],
                ),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      buildTodo(todo);
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => route.willHandlePopInternally);
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
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
