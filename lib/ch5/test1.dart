import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class User {
  String name;
  String phone;
  String email;

  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  // 목록 구성 데이터...
  List<User> users = [
    User('홍길동', '0100001', 'a@a.com'),
    User('김길동', '0100001', 'a@a.com'),
    User('이길동', '0100001', 'a@a.com'),
    User('박길동', '0100001', 'a@a.com'),
  ];

  Widget userTile(User user) {
    return ListTile(
      leading: CircleAvatar(
        // 왼쪽 위젯 이미지 아니어도 된다.
        radius: 25,
        backgroundColor: Colors.blue,
        child: Text(
          user.name[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.phone),
      trailing: Icon(Icons.more_vert),
      onTap: () {
        // 항목 선택 이벤트
        print(user.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Listview test')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length, //항목 갯수
                itemBuilder: (context, index) {
                  // 항목을 구성하기 위해서 자동 호출.. 이 함수에서 리턴시키는 위젯이 항목
                  return Column(
                    children: [
                      userTile(users[index]),
                      Divider(height: 2, color: Colors.black),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: users.length, //항목 갯수
                itemBuilder: (context, index) {
                  // 항목을 구성하기 위해서 자동 호출.. 이 함수에서 리턴시키는 위젯이 항목
                  return userTile(users[index]);
                },
                separatorBuilder: (context, index) {
                  // 리턴 시키는 위젯이 각 항목 사이에 구분자로 추가된다.
                  return Divider(height: 2, color: Colors.black);
                },
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
              itemCount: users.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Text(users[index].name),
                );
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}
