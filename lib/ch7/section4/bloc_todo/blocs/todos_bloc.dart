import 'package:bloc/bloc.dart';
import '../states/todos_state.dart';
import '../events/todos_event.dart';


// Bloc 상속된 클래스 선언
// 제네릭 타입 추가
// 필수 작성 생성자 추가
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc(): super(TodosState([])) {  // 상태값(TodosState)에 맞는 초깃값
    on<AddTodoEvent>((event, emit) {
      List<Todo> newTodos = List.from(state.todos)
          ..add(event.todo);
      // 더하고 발행
      emit(TodosState(newTodos));
    });

    on<DeleteTodoEvent>((event, emit) {
      List<Todo> newTodos = List.from(state.todos)  // 과거의 데이터
          ..remove(event.todo); // 과거의 데이터를 삭제
      // 삭제하고 발행
      emit(TodosState(newTodos));
    });

    on<ToggleCompletedTodoEvent>((event, emit) {
      List<Todo> newTodos = List.from(state.todos);
      int index = newTodos.indexOf(event.todo);
      newTodos[index].togglecompleted();
      emit(TodosState(newTodos));
    });
  }

  @override
  void onTransition(Transition<TodosEvent, TodosState> transition) {
    super.onTransition(transition);
    print('transition... $transition');
  }
}
