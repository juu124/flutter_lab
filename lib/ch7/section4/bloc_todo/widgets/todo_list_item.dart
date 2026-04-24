import 'package:flutter/material.dart';
import '../states/todos_state.dart';
import '../events/todos_event.dart';
import '../blocs/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    //add.....................
    TodosBloc todosBloc = BlocProvider.of<TodosBloc>(context);

    return ListTile(
      leading: Checkbox(
          value: todo.completed,
          onChanged: (bool? checked) {
            // bloc에 이벤트 발생
            todosBloc.add(ToggleCompletedTodoEvent(todo));
          }
      ),
      title: Text(todo.title),
      trailing: IconButton(
          onPressed: () {
            // bloc에 이벤트 발생
            todosBloc.add(DeleteTodoEvent(todo));
          },
          icon: Icon(Icons.delete, color: Colors.red,),
      ),
    );
  }
}
