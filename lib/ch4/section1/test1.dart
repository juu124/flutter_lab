import 'dart:convert'; // json parser를 여기에서 제공한다.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 애셋 파일을 로딩
  // 파일 로딩이다.. 시간이 오래 걸릴 수 있다..
  // 이 함수를 호출한 곳이 대기상태에 빠질 수 있다.
  // 비동기로 처리.. 함수 호출하고, 호출한 곳은 자기 할일 한다.
  // Future : 미래에 발생하는 데이터.. 비동기를 목적으로 한다.
  // Future 타입으로 리턴 타입을 선언하고, 함수 선언 위치에 async를 추가하면,
  // 이 함수를 호출한 곳에 바로 Future 타입의 객체가 리턴된다.
  Future<String> useRootBundle() async {
    // Future를 리턴 시킨 후에 .. 함수 내부가 비동기적으로 실행.. 결과 발생 리턴
    // 위젯이 아닌 다른곳에서 애셋파일 로딩시 이용하는 api...
    return await rootBundle.loadString('assets/text/my_text.txt');
  }

  Future<String> useDefaultAssetBundle(BuildContext context) async {
    // 위젯 내에서 애셋 파일 로딩시 권장하는 코드 스타일
    return await DefaultAssetBundle.of(
      context,
    ).loadString('assets/text/my_text.txt');
  }

  Future<Map<String, dynamic>> loadUsers() async {
    // json 파일은 읽어들일때는 단순 문자열이다. 파싱해야. 데이터가 나온다.
    String jsonString = await rootBundle.loadString('assets/text/test.json');
    // 파싱..
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('asset test')),
        body: Column(
          children: [
            // userRootBundle을 호출해서 리턴된 데이터로 화면을 구성하겠다.
            // 리턴 타입이 Future 타입이다. 호출과 동시에 리턴되기는 하지만,
            // 시간이 지난 후 에 실제 데이터가 발생이 되고, 그 발생되는 순간을 감지해서.. 화면을 구성해야 한다.
            // Future 타입의 데이터를 감지해서, 화면을 구성하기 위한 위젯을 제공한다.
            FutureBuilder(
              future: useRootBundle(),
              // future에서 지정한 Future 타입의 데이터가 발생하는 순간, Builder의 함수가 호출된다.
              // 두번 째 매개변수가 데이터이다.
              builder: (context, snapshot) {
                return Text('rootBundle: ${snapshot.data}');
              },
            ),
            FutureBuilder(
              future: useDefaultAssetBundle(context),
              builder: (context, snapshot) {
                return Text('DefaultAssetBundler : ${snapshot.data}');
              },
            ),
            FutureBuilder<Map<String, dynamic>>(
                future: loadUsers(),
                builder: (context, snapshot) {
                  // 원하는 데이터 추출..
                  int total = snapshot.data!['total'];
                  List<Map<String, dynamic>> users =
                  List<Map<String, dynamic>>.from(snapshot.data!['users']);
                  return Column(
                    children: [
                      Text('전체 사용자 : $total 명'),
                      Text('users[0] : ${users[0]['name']} - ${users[0]['email']}'),
                    ],
                  );
                },
            ),
            // 이미지 파일을 직접 읽어들여서, 화면 구성하기. 
            // 이미지는 byte data이다.
            FutureBuilder<Uint8List>(
                future: rootBundle.load('images/icon.jpg').then(
                    (byteData) => byteData.buffer.asUint8List(),
                ),
                builder: (context, snapshot) {
                  return Image.memory(snapshot.data!);
                },
            ),
            // 이미지 애셋을 읽어들여서 Image 위젯으로 화면을 출력하는 기본은 위의 코드 스타일이지만,
            // Image 의 생성자에서 위 코드 대신 실행할 수 있는 방법이 있다.
            Image.asset('images/icon.jpg'),
            Image.asset('images/icon/user.png'),
          ],
        ),
      ),
    );
  }
}
