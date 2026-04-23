import 'package:flutter/material.dart';
import 'package:flutter_lab/ch7/section2/provider_todo/providers/todos_provider.dart';
import 'package:flutter_lab/ch7/section2/provider_todo/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() =>  runApp(MyApp());

// 프로바이더 등록
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosModel(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}