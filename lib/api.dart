import 'package:http/http.dart' as http;
import 'Todo.dart';
import 'dart:convert';

final String apiKey = 'p5nsaSjf847MNdss--12';

final String apiEndpoint = 'https://nic05.pythonanywhere.com/todo-app/';
//final String apiEndpoint = 'http://192.168.1.8:5000/todo-app/';

final Map<String, String> fetchBody = {'apiKey': apiKey};


void editTodo(Todo todo) {

  Map<String, String> editBody = {
    'apiKey': apiKey,
    'title': todo.title,
    'desc': todo.desc,
    'rowid': todo.id
  };

  http.post(apiEndpoint + 'edit', body: editBody);

}


void deleteTodo(Todo todo) {

  Map<String, String> deleteBody = {
    'apiKey': apiKey,
    'rowid': todo.id
  };

  http.post(apiEndpoint + 'delete', body: deleteBody);
  Todo.todosList.removeWhere((element) => element.id == todo.id);
}


void addTodo(Todo todo) async {

  Map<String, String> addBody = {
  'apiKey': apiKey,
  'title': todo.title,
  'desc': todo.desc,
  'dateCreated': todo.dateCreated.toIso8601String().substring(0, 10)
  };

  http.Response response = await http.post(apiEndpoint + 'add', body: addBody);
  todo.id = response.body;

  Todo.todosList.add(todo);
}


List<Todo> _processTodos(String rawTodos) {

  List<Todo> todos = [];

  // if no todos received --> return empty list
  if (rawTodos == '') return todos;

  for (Map<String, dynamic> todo in json.decode(rawTodos)) {
    todos.add(Todo(
      todo['title'],
      todo['desc'],
      DateTime.parse(todo['dateCreated']),
      todo['rowid'].toString()
    ));
  }
  return todos;
}


Future<void> getTodos() async {
  http.Response response = await http.post(apiEndpoint + 'fetch', body: fetchBody);
  Todo.todosList = _processTodos(response.body);
}
