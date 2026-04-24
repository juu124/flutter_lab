// 이벤트가 3개여서 3개의 클래스가 나온다.
import '../states/todos_state.dart';

// 타입 통일
abstract class TodosEvent {}

class AddTodoEvent extends TodosEvent {
  Todo todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodosEvent {
  Todo todo;
  DeleteTodoEvent(this.todo);
}

class ToggleCompletedTodoEvent extends TodosEvent {
  Todo todo;
  ToggleCompletedTodoEvent(this.todo);
}