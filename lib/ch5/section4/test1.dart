import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // 앱의 대표 색상.. 여기에 지정한 색상을 기준으로 자체적으로 앱의 각종 색상을 조화롭게 선택..
          seedColor: Colors.red,
          primary: Colors.blue,
          secondary: Colors.orange,
          surface: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
            textStyle: TextStyle(fontSize: 24)
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Test')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('button')),
              Checkbox(value: true, onChanged: (_) {}),
              Switch(value: true, onChanged: (_) {}),
              TextButton(onPressed: () {}, child: Text('TextButton')),
              OutlinedButton(onPressed: () {}, child: Text('OutlineButton')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
