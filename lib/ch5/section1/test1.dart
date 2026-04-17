// 로그인 화면을 가정해서 구성
// 유효성 검증 - 필수입력 - 에러 메세지..
// 비밀번호.. 보기 기능
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: loginScreen());
  }
}

class loginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<loginScreen> {
  // 유저 입력 데이터 획득
  final idController = TextEditingController();
  final pwController = TextEditingController();

  // pw 보일 것인가??? 상태 데이터...
  bool isPasswordVisible = false;

  // 유효성 검증 에러 문자열..상태데이터..
  String? idError;
  String? pwError;

  onSubmit() {
    // submit 버튼 클릭 이벤트
    setState(() {
      // 유저 입력 데이터 획득.. 유효성 검증..
      idError = idController.text.isEmpty ? 'ID를 입력해 주세요.' : null;
      pwError = pwController.text.isEmpty ? '비밀번호를 입력해 주세요' : null;

      if (idError == null && pwError == null) {
        // 전체.. valid..
        // 네트워킹 하고난 후 가정......................
        print('login : ${idController.text}, ${pwController.text}');
      }
    });
  }

  @override
  void dispose() {
    // 우리가 만든 controller 이지만, 대입되어 유저 입력되는 곳은 다른 객체..
    // 명시적으로 알려줘야 한다. 그러지 않으면 메모리 누수 문제 발생 가능성이 있다.
    idController.dispose();
    pwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'ID',
                hintText: '아이디를 입력하세요',
                // 입력시 사라지는 문자열
                border: OutlineInputBorder(),
                errorText: idError,
                // null 이면 출력 안된다.
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                // 포커스 X , 에러 O
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              // 포커스 이동키
              onChanged: (_) {
                // 유저가 입력 한 순간.. 만약 에러메시지가 출려되고 있다며느 에러 지우기
                idError = null;
              },
            ),

            SizedBox(height: 16),

            //pw...............
            TextField(
              controller: pwController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: '비밀번호를 입력하세요',
                errorText: pwError,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                // 포커스 X , 에러 O
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              textInputAction: TextInputAction.done,
              onChanged: (_) {
                pwError = null;
              },
            ),

            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: onSubmit, child: Text('로그인')),
            ),
          ],
        ),
      ),
    );
  }
}
