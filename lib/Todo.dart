
class Todo {

  static List<Todo> todosList = [];

  String title;
  String desc;
  DateTime dateCreated;
  String id;

  Todo(this.title, this.desc, this.dateCreated, this.id);
}
