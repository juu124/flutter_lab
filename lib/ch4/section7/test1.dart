import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Size Test'),),
        body: Column(
          children: [
            Column(
              children: [
                Container(color: Colors.red, width: 50, height: 50,),
                Container(color: Colors.green, width: 150, height: 50,),
                Container(color: Colors.blue, width: 100, height: 50,),
              ],
            ),
            SizedBox(height: 10,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(color: Colors.red, width: 50, height: 50,),
                Container(color: Colors.green, width: 150, height: 50,),
                Container(color: Colors.blue, width: 100, height: 50,),
              ],
            ),
            SizedBox(height: 10,),

            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(color: Colors.red, width: 50, height: 50,),
                  Container(color: Colors.green, width: 150, height: 50,),
                  Container(color: Colors.blue, width: 100, height: 50,),
                ],
              ),
            ),
            SizedBox(height: 10,),

            ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 300,
                  maxHeight: 50,
                ),
              child: Container(color: Colors.amber, width: 150, height: 150,),
            ),
          ],
        ),
      ),
    );
  }
}