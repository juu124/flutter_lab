import 'package:flutter/material.dart';
import 'package:flutter_lab/ch7/section2/provider_todo/providers/todos_provider.dart';

import 'add_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/todo_list.dart';

import 'add_screen.dart';

class TabScreen extends StatelessWidget {
  List<Todo> todos;

  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(child: TodoList(todos: this.todos));
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos-Bloc'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTodoScreen()),
              );
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
          // provider data 이용해서 화면 구성
          // provider.of(), Consumer
          Consumer<TodosModel>(
            // model : 제네릭 타입의 provider data 전달..
            builder: (context, model, child) {
              return TabBarView(
                controller: controller,
                children: [
                  TabScreen(model.todos),
                  TabScreen(
                    model.todos.where((todo) => !todo.completed).toList(),
                  ),
                  TabScreen(
                    model.todos.where((todo) => todo.completed).toList(),
                  ),
                ],
              );
            },
          ),
    );
  }
}
