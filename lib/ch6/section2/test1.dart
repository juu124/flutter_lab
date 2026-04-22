import 'package:flutter/material.dart';
import 'user.dart';
import 'user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final service = UserService();

  User? user;
  String error = '';

  Future<void> searchUser() async {
    // 유저 입력 데이터 획득..
    final input = controller.text.trim(); // trim : 앞뒤 공백 문자 제거
    if(input.isEmpty) {
      setState(() {
        error = 'id 입력해 주세요.';
      });
      return;
    }

    final id = int.tryParse(input); // 유저 키보드 입력은 문자열이다. 문자열을 숫자로 변경
    // int.parse() 는 만약 문자열이 숫자로 변경할 수 없다면 exception
    // int.tryParse() 은 숫자로 변경할 수 없다면 null 리턴
    if(id == null || id < 1 || id > 10) {
      setState(() {
        error = '1 ~ 10 사이의 숫자를 입력해 주세요.';
      });
      return;
    }

    // 네트워킹 시도..
    try {
      final networkUser = await service.getUserById(id);
      setState(() {
        user = networkUser;
      });
    } catch(e) {
      print('error : $e');
      setState(() {
        error = 'network error';
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('dio test'),),
        body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                    onSubmitted: (_) => searchUser(),
                  ),
                ),
                SizedBox(width: 12,),
                ElevatedButton(onPressed: searchUser, child: Text('검색')),
              ],
            ),
            SizedBox(height: 24,),
            if (error.isNotEmpty)
              Text(error),

            Text('${user?.id} ${user?.email} ${user?.phone}')
          ],
        ),),
      ),
    );
  }
}