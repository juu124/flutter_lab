// RegisterWidget : 회원정보(이름, 전화번호, 이메일) 등록하는 위젯
// WelcomeWidget : 등록된 정보가 출력
// 데이터 공유는 bloc를 이용한다.
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('회원가입')),
        body: RegisterWidget(),
      ),
    );
  }
}

class RegisterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterWidgetState();
  }
}

class RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              edittext('이름'),
              SizedBox(height: 16),
              edittext('전화번호'),
              SizedBox(height: 16),
              edittext('이메일'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // todo 등록된 데이터 화면전환할때 뿌리기
                },
                child: Text('가입'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextField edittext(String labelText) {
  return TextField(
    decoration: InputDecoration(
      labelText: labelText,
      hintText: '$labelText을/를 입력해주세요.',
    ),
    keyboardType: labelText == '전화번호'
        ? TextInputType.phone
        : labelText == '이메일'
        ? TextInputType.emailAddress
        : TextInputType.text,
  );
}

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}