import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

//Todo 를 provider 로 등록하는데.. 수정 가능하게..
//함수 호출해서.. 그럴려면 수정 함수를 가지는 notifier 를 직접 준비..

class TodosNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [];//초기 값..

  void addTodo(Todo todo){
    state = [...state, todo];//state.. Notifier 내에 선언된 변수.. 이 Notifier 가 만드는 상태.
  }

  void toggleTodo(Todo todo){
    state = [
      for(final i in state)
        if(i == todo)
          Todo(title: i.title, completed: !i.completed)
        else
          i,
    ];
  }

  void deleteTodo(Todo todo){
    state = state.where((t) => t != todo).toList();
  }
}

//provider 등록..
//notifier 이용..., 단순 값 변경이 아니라..함수 호출해서 변경..
//NotifierProvider : 별도의 Notifier 함수 호출 값 변경 - 상태..
final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(
        () => TodosNotifier()
);