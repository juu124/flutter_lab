import 'package:flutter/material.dart';
import 'dart:convert'; // json decode/encode를 제공한다.

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

// json 데이터 추상화 클래스
// json -> 클래스 객체
// 클래스 객체 -> json
class Todo {
  int id;
  String title;
  bool complete;

  Todo(this.id, this.title, this.complete);

  // json 문자열 -> jsonDecode() -> Map이 전달 된다.
  // 자동으로 되는 것은 없다. 개발자가 직접 Map을 이용해 멤버 초기화 시키는 생성자를 준비하라
  Todo.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      complete = json['complete'];

  // 객체 -> Map -> jsonEncode() -> 문자열
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'complete': complete,
  };
}

class MyAppState extends State<MyApp> {
  // 서버에서 전달 받은 json 문자열로 가정..
  String jsonStr = '{"id": 1, "title":"hello", "complete": false}';
  Todo? todo;
  String? result = '';

  onPressDecode() {
    // json 문자열 -> Map
    Map<String, dynamic> map = jsonDecode(jsonStr);
    // map -> Todo 객체
    todo = Todo.fromJson(map);
    setState(() {
      result = 'decode : id = ${todo?.id}, title = ${todo?.title}, complete = ${todo?.complete}';
    });
  }
  onPressEncode() {
    // 객체 -> map
    final map = todo!.toJson();
    // map -> json 문자열
    setState(() {
      result = 'encode : ${jsonEncode(map)}';
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('json test'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$result'),
              ElevatedButton(
                onPressed: onPressDecode,
                child: Text('Decode'),
              ),
              ElevatedButton(
                onPressed: onPressEncode,
                child: Text('Encode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
