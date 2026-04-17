import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('align test'),),
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, 0.0), // Alignment.center, 센터가 기준점..
              child: Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              ),
            ),
            Align(
              alignment: FractionalOffset(1.0, 0.0), // left/top 이 기준점
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
            ),
            Positioned( // 부모의 4방향 여백으로 배치
              left: 40.0,
              top:40.0,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}