import 'package:http/http.dart' as http;
import 'Todo.dart';
import 'dart:convert';

final String apiKey = 'p5nsaSjf847MNdss--12';
final String apiEndpoint = 'https://nic05.pythonanywhere.com/todo-app';
final Map<String, String> headers = {'apiKey': apiKey};

List<Todo> _processTodos(String rawTodos) {
  List<Todo> todos = [];
  for (Map<String, String> todo in json.decode(rawTodos)) {
    todos.add(Todo(todo['title'], todo['description'],
        DateTime.parse(todo['dateCreated'])));
  }
  return todos;
}

Future<List<Todo>> getTodos() async {
  http.Response response = await http.post(apiEndpoint, headers: headers);
  return _processTodos(response.body);
}
