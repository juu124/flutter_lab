import 'package:flutter/material.dart';
import 'package:flutter_lab/ch7/section2/provider_todo/widgets/todo_list_item.dart';
import '../providers/todos_provider.dart';






class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTodos(),
    );
  }

  //add...................
  List<Widget> getChildrenTodos() {
    return todos.map((todo) => TodoListItem(todo: todo)).toList();
  }
}
