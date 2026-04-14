// StatelessWidget vs Statefulsidget
// flutter sdk 에서 제공하는 모든 widget 이 포함
import 'package:flutter/material.dart';

main() {
  // 앱이 실행되면서 최초에 화면에 출력해야하는 위젯을 명시..
  runApp(MyApp());
}

// 화면 단위를 지칭하는 위젯 클래스는 StatelessWidget을 상속하는 것을 권장
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // build 함수 자동 호출되고, 이 함수에서 리턴시키는 위젯 트리가
    // 이 위젯의 화면 정보이다.
    // 위넷 트리의 루트.. MaterialApp 필수는 아니다. 테마 설정. 라우팅 처리(화면전환) 등의 도움을 주는 위젯이다.
    // 사실상 필수
    return MaterialApp(
      // 화면의 기본 구조.. 사실상 필수이다.
      home: Scaffold(
        appBar: AppBar(title: Text('Widget Test')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyStatelessWidget(),
              MyStatedfulWidget(),
            ]),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  // StatelessWidget 이 상태를 가지지 못한다는 것이지.. 그렇다고 변수를 가지지 못한다는 것은 아니다.
  bool enabled = false;
  String stateText = 'disable';

  void changeCheck() {
    print('stateless ... changeCheck');
    // Stateless 는 setState()를 지원하지 않는다.
    // 다시 생성되어 외부 데이터에 의해 화면이 바뀔 수는 있지만,
    // 자신의 자체 능력으로 화면을 갱신을 할 수 없다.
    if (enabled) {
      stateText = 'disable';
      enabled = false;
    } else {
      stateText = 'enable';
      enabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 가로 방향 나열
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: changeCheck,
          icon: (enabled
              ? Icon(Icons.check_box, size: 20)
              : Icon(Icons.check_box_outline_blank, size: 20)),
          color: Colors.red,
        ),
        Text('$stateText', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
      ],
    );
  }
}

class MyStatedfulWidget extends StatefulWidget {
  // StatefulWidget 을 위한 State 객체를 결정하기 위해서 자동 호출..
  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyStatedfulWidget> {
  bool enabled = false;
  String stateText = 'disable';

  void changeCheck() {
    print('stateful ... changeCheck');
    // stateful 의 상태 값을 변경했다고 화면 갱신이 되는 것이 아니라..
    // setState() 함수를 이용해서 화면 갱신 명령을 내려야 한다.
    // setState() 함수만 호출이되면, 자동으로 build 함수가 호출된다.
    // setState() 매개변수에 지정한 함수내에서 갑을 교체한다. 그리고
    // 다른 곳에서 화면에 찍히는 값을 교체하며느 교체된 값이 화면에 반영되지 않을 수 있다. build를 비동기로 호출하기 때문에 될수도 있고 안될 수도 있다.
    // 매개변수의 함수를 먼저 호출하고, 그 함수 호출이 끝나면 build를 호출하게 되어 있다.
    setState(() {
      if (enabled) {
        stateText = 'disable';
        enabled = false;
      } else {
        stateText = 'enable';
        enabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 가로 방향 나열
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: changeCheck,
          icon: (enabled
              ? Icon(Icons.check_box, size: 20)
              : Icon(Icons.check_box_outline_blank, size: 20)),
          color: Colors.red,
        ),
        Text('$stateText', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
      ],
    );
  }
}
