import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todos_provider.dart';


class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    //add.....................
    return ListTile(
      leading: Checkbox(
          value: todo.completed,
          onChanged: (bool? checked) {
            // 체크에 따른 이벤트
            // 상태 변경
            // 상태를 read 해서 화면에 출력하겠다면 Provider.of, Consumer, Selector 중에서 사용하면 된다.
            // 상태를 변경만 하겠다는 것. 그렇다면 Provider.of 사용하기
            // listen : false, 상태값 변경 시도다. 변경되었을 때 나를 rebuild 해야하는가? false(하지마라)
            Provider.of<TodosModel>(context, listen: false).toggleTodo(todo);
          }
      ),
      title: Text(todo.title),
      trailing: IconButton( // 오른쪽 아이콘 버튼 (삭제버튼)
        onPressed: () {
          // 상태 변경
          Provider.of<TodosModel>(context, listen: false).deleteTodo(todo);
        },
        icon: Icon(Icons.delete, color: Colors.red,),
      ),
    );
  }
}
