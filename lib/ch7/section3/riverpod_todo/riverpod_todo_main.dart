import 'package:flutter/material.dart';
import 'package:flutter_lab/ch7/section3/riverpod_todo/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() => runApp(
    ProviderScope(
        child: TodosApp()
    )
);

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //add.................................
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('riverpod todo'),),
        body: HomeScreen(),
      ),
    );
  }
}