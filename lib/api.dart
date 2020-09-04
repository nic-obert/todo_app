import 'package:http/http.dart' as http;
import 'Todo.dart';
import 'dart:convert';

final String apiKey = 'p5nsaSjf847MNdss--12';

//final String apiEndpoint = 'https://nic05.pythonanywhere.com/todo-app/';
final String apiEndpoint = 'http://192.168.1.8:5000/';

final Map<String, String> fetchBody = {'apiKey': apiKey};



void deleteTodo(Todo todo) {
  Map<String, String> deleteBody = {
    'apiKey': apiKey,
    'id': todo.id
  };

  http.post(apiEndpoint + 'delete', body: deleteBody);
}


void addTodo(Todo todo) {

  Todo.todosList.add(todo);

  Map<String, String> addBody = {
  'apiKey': apiKey,
  'title': todo.title,
  'desc': todo.desc,
  'dateCreated': todo.dateCreated.toIso8601String().substring(0, 10)
  };
  print(addBody);

  http.post(apiEndpoint + 'add', body: addBody);
}


List<Todo> _processTodos(String rawTodos) {
  print('--');
  print(rawTodos);
  print('--');
  List<Todo> todos = [];

  // if no todos received --> return empty list
  if (rawTodos == '') return todos;

  for (Map<String, dynamic> todo in json.decode(rawTodos)) {
    todos.add(Todo(
      todo['title'],
      todo['desc'],
      DateTime.parse(todo['dateCreated']),
      todo['id']
    ));
  }
  return todos;
}


Future<void> getTodos() async {
  http.Response response = await http.post(apiEndpoint + 'fetch', body: fetchBody);
  print(response.request.url);
  Todo.todosList = _processTodos(response.body);
}
