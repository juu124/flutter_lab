import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todos_notifier.dart';


class TodoListItem extends ConsumerWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //add.....................
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked){
          //상태 데이터 변경.. notifier 획득.. 그곳의 함수 호출..
          ref.read(todosProvider.notifier).toggleTodo(todo);
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        onPressed: (){
          ref.read(todosProvider.notifier).deleteTodo(todo);
        },
        icon: Icon(Icons.delete, color: Colors.red,),
      ),
    );
  }
}