import 'package:flutter/material.dart';
import 'package:flutter_lab/ch7/section4/bloc_todo/screens/home_screen.dart';
import './blocs/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //add.................................
    return BlocProvider<TodosBloc>(
      create: (context) => TodosBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}