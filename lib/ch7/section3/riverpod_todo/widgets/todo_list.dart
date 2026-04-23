import 'package:flutter/material.dart';
import '../models/todo.dart';
import './todo_list_item.dart';





class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: todos.map((todo) => TodoListItem(todo: todo)).toList()
    );
  }

//add...................

}