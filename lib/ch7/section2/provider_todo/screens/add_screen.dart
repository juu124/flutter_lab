import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/todos_provider.dart';



class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final controller = TextEditingController(); // text 입력 받기
  bool completedStatus = false;

  @override
  void dispose() {
    controller.dispose(); // 컨트롤러는 dispose할때 항상 dispose 해주어야 한다.
    super.dispose();
  }

  // 등록 이벤트 콜백
  void onAdd() {

    final String title = controller.text;
    final bool completed = completedStatus;
    if (title.isNotEmpty) {
      final Todo todo = Todo(
        title: title,
        completed: completed,
      );
      //add........................................
      // provider를 이용.. 앱 전역에서 데이터 유지되게하기
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      // 등록 된 후에 자동으로 이전 화면으로 바로 이동
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: controller),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                          completedStatus = checked ?? false;
                        }),
                    title: Text('Complete?'),
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
