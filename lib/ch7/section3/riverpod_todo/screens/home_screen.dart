import 'package:flutter/material.dart';
import 'add_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_screen.dart';
import '../models/todo.dart';
import '../providers/todos_notifier.dart';
import '../widgets/todo_list.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;

  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(
        todos: this.todos,
      ),
    );
  }
}


class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //상태 데이터 획득.. 변경 구독..
    final todos = ref.watch(todosProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todos-Bloc'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AddTodoScreen(),
                ),);
              },
            ),
          ],
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(text: 'All'),
              Tab(text: 'Active'),
              Tab(text: 'Complete'),
            ],
          ),
        ),
        body:
        //add...............................
        TabBarView(
          controller: controller,
          children: [
            TabScreen(todos),
            TabScreen(todos.where((todo) => !todo.completed).toList()),
            TabScreen(todos.where((todo) => todo.completed).toList())
          ],
        )
    );


  }
}