class Todo {
  String title;
  bool completed;
  Todo({required this.title, this.completed = false});

  void togglecompleted() {
    completed = !completed;
  }
}

class TodosState {
  List<Todo> todos;
  TodosState(this.todos);
}