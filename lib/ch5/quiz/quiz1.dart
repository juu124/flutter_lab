import 'package:flutter/material.dart';

// 회원가입
// Form 이용
// id(필수), pw(필수, 6자 이상), name(필수)
// 약관에 동의 체크 박스가 체크된 경우에 가입 버튼이 활성화

// 유저 입력 데이터 저장할 변수
String? email;
String? password;
String? name;
int phoneNumber = 0;

bool? isJavaChecked = false;
bool? isKotlinChecked = false;
bool? isDartChecked = false;
bool? isTermsChecked = false;

bool isSignedUp = false;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('회원가입')),
        body: SignUpScreen(),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 폼을 활용해서 유효성 검증
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      edittext('ID (이메일)'),
                      SizedBox(height: 10),

                      edittext('비밀번호'),
                      SizedBox(height: 10),

                      edittext('이름'),
                      SizedBox(height: 10),

                      edittext('전화번호'),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                buildCheckRow('Java', isJavaChecked, (value) {
                  setState(() {
                    isJavaChecked = value;
                  });
                }),
                buildCheckRow('Kotlin', isKotlinChecked, (value) {
                  setState(() {
                    isKotlinChecked = value;
                  });
                }),
                buildCheckRow('Dart', isDartChecked, (value) {
                  setState(() {
                    isDartChecked = value;
                  });
                }),
                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isTermsChecked,
                        onChanged: (value) {
                          setState(() {
                            isTermsChecked = value;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          '이용약관 및 개인정보처리방침에 동의합니다. (필수)',
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: isTermsChecked ?? false ? () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      setState(() {
                        isSignedUp = true;
                      });
                    }
                  } : null,
                  child: Text('가입하기'),
                ),

                SizedBox(height: 10),

                if (isSignedUp)
                  Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '회원가입 정보',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.blue[900],
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'ID: $email',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Colors.blue[900],
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'PW: $password',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: Colors.blue[900],
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '이름: $name',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            color: Colors.blue[900],
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '전화번호: $phoneNumber',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.apps, color: Colors.blue[900], size: 20),
                          SizedBox(width: 10),
                          Text(
                            '관심사항: ${isJavaChecked == true ? 'Java, ' : ''}${isKotlinChecked == true ? 'Kotlin, ' : ''}${isDartChecked == true ? 'Dart' : ''}',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField edittext(String? type) {
  return TextFormField(
    decoration: InputDecoration(
      prefixIcon: typeIcon(type!),
      labelText: type,
      border: OutlineInputBorder(),
    ),
    keyboardType: type == '전화번호'
        ? TextInputType.phone
        : type == 'ID (이메일)'
        ? TextInputType.emailAddress
        : TextInputType.text,
    validator: (value) {
      if (type == '전화번호') return null;

      if (value == null || value.isEmpty) {
        return '$type를 입력해주세요';
      }

      if (type == '비밀번호' && value!.length < 6) {
        return '$type를 6자 이상 입력해주세요.';
      }
      return null;
    },
    onSaved: (value) {
      if (value == null) return;

      switch (type) {
        case 'ID (이메일)':
          email = value;
          break;
        case '비밀번호':
          password = value;
          break;
        case '이름':
          name = value;
          break;
        case '전화번호':
          phoneNumber = int.tryParse(value) ?? 0;
      }
    },
  );
}

Widget buildCheckRow(String label, bool? isChecked, Function(bool?) onChanged) {
  return Row(
    children: [
      Checkbox(value: isChecked, onChanged: onChanged),
      Text(label),
    ],
  );
}

Icon typeIcon(String type) {
  switch (type) {
    case 'ID (이메일)':
      return Icon(Icons.email_outlined);
    case '비밀번호':
      return Icon(Icons.lock_outline);
    case '이름':
      return Icon(Icons.person_outline);
    case '전화번호':
      return Icon(Icons.call_outlined);
    default:
      return Icon(Icons.info_outline);
  }
}
