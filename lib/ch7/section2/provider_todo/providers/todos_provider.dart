// Provider 에 의해 공개될 상태 선언
import 'package:flutter/material.dart';

class Todo {
  String title;
  bool completed;

  Todo({required this.title, this.completed = false});

  void togglecompleted() {
    completed = !completed;
  }
}

class TodosModel with ChangeNotifier {
  // 상태..
  List<Todo> todos = [];

  // 상태 변경 함수
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final index = todos.indexOf(todo);
    todos[index].togglecompleted();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }
}
