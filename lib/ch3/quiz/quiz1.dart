import 'package:flutter/material.dart';

void main() {
  runApp(MainScreen());
}

// 앨리먼트 트리의 객체
// 위젯만
// 실제 AssetBundle

// 교체가 가능하다. 존재하지 않는 에셋데이터를 가져
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Counter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [DetailOption()],
          ),
        ),
      ),
    );
  }
}

class DetailOption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailOptionState();
  }
}

class DetailOptionState extends State<DetailOption> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('증가'),
        ),
      ],
    );
  }
}
