import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // PageView에 의해 화면이 순차적으로 나온다.
  // 만일 순차적으로 나오는 순간의 이벤트 처리를 하고 싶거나.
  // 설정을 하고 싶거나
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8 // 0~1값 현재 화면을 기준으로 왼쪽 오른쪽의 화면이 현재 화면에서 어느정도 같이 보일 것인가?
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PageView Test'),),
        body: PageView(
          controller: controller,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.red,
              child: Center(
                child: Text('One', style: TextStyle(color: Colors.white, fontSize: 30),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.green,
              child: Center(
                child: Text('One', style: TextStyle(color: Colors.white, fontSize: 30),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.blue,
              child: Center(
                child: Text('One', style: TextStyle(color: Colors.white, fontSize: 30),),
              ),
            )
          ],
        ),
      ),
    );
  }
}