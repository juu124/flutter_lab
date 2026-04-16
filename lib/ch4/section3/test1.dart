import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Icon - Event Test')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Flutter Icon...
              // network 에서 다운로드 되어 적용된다. 빌드 시점에. 런타임 시점에는 로컬이다..
              Icon(Icons.alarm, size: 100, color: Colors.red),
              // fontawsome icon
              FaIcon(FontAwesomeIcons.bell, size: 100),
              IconButton(
                onPressed: () {
                  print('icon button click..');
                },
                icon: Icon(Icons.alarm, size: 100),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.bell, size: 100),
              ),
              // flutter 이벤트 처리의 기본은 GestureBetector 이다..
              // IconButton, ElevatedButton 등은 모두 내부적으로 GestureDetector 이용..
              // 모든 화면을 이벤트 처리 가능하다..
              GestureDetector(
                child: Image.asset('images/icon/user.png'),
                // 원하는 이벤트 등록..
                onTap: () {
                  print('image tap....');
                },
                onVerticalDragStart: (DragStartDetails details) {
                  // 화면 좌표..
                  print(
                    'global : ${details.globalPosition.dx}, ${details.globalPosition.dy}',
                  );
                  // 위젯 좌표. 좌측 상단의 기준점
                  print(
                    'local : ${details.localPosition.dx}, ${details.localPosition.dy}',
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('button'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text('button'),
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Text('button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
