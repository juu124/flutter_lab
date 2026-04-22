import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

// dto 클래스라고 가정
class Post {
  int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title'], body: json['body']);
  }
}

class MyAppState extends State<MyApp> {
  Post? post = null; // 초기에 아무값도 없다가 통신을 통해서 데이터가 들어오면서 상태가 바뀐 것이기 때문에 화면도 바뀐다.

  // GET 방식 ===============================================
  onPressGet() async {
    // async : 언제 get이 벌어질지 모르기 때문에 비동기
    try {
      // await : 받을 때까지 기다린다.
      http.Response response = await http
          .get(
            Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
            headers: {
              'User-Agent':
                  'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 '
                  '(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',
              'Accept': 'application/json'
            },
          )
          .timeout(Duration(seconds: 10));

      print('status code : ${response.statusCode}');

      setState(() {
        // response.body는 외부에서 전달 받은 데이터
        // json 데이터를 dto로 변환
        post = Post.fromJson(jsonDecode(response.body));
      });
    } on TimeoutException catch (e) {
      print('timeout : $e');
    } catch (e) {
      print('error : $e');
    }
  }

  onPressPost() async {
    try {
      // await : 받을 때까지 기다린다.
      http.Response response = await http
          .post(
            Uri.parse('https://jsonplaceholder.typicode.com/posts'),
            body: {
              'title': 'hello',
              'body': 'world',
              'userId': '1',
            }, // 가지고 있는 데이터를 위로 링크로 전달하겠다.
          )
          .timeout(Duration(seconds: 10));

      print('status code : ${response.statusCode}');

      setState(() {
        // response.body는 외부에서 전달 받은 데이터
        // json 데이터를 dto로 변환
        post = Post.fromJson(jsonDecode(response.body));
      });
    } on TimeoutException catch (e) {
      print('timeout : $e');
    } catch (e) {
      print('error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('http test')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('id: ${post?.id}, title: ${post?.title}, ${post?.body}'),
              ElevatedButton(onPressed: onPressGet, child: Text('get')),
              ElevatedButton(onPressed: onPressPost, child: Text('post')),
            ],
          ),
        ),
      ),
    );
  }
}
