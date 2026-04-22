import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 특정 업무가 진행되는 함수.. 이 함수가 반복적으로 호출이 되어야 한다고 가정한다.
  int calFun(int x) {
    return x * x;
  }

  Stream<int> test() {
    Duration duration = Duration(seconds: 3);
    Stream<int> stream = Stream<int>.periodic(
        duration, calFun); // calFun 함수를 3초에 한번씩 호출하고 그 결과를 스트림으로 리턴한다.
    return stream.take(5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('stream test'),),
          body: StreamBuilder( // stream 에 의해 반복적으로 발생되는 데이터로 화면 구성하기 위한 위젯
            stream: test(),
            builder: (context, snapShot) { // 최초 호출 그리고 반복적으로 호출된다.
              if (snapShot.connectionState == ConnectionState.done) {
                // 데이터 발행이 완료되었다면..
                return Text('completed');
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                // 데이터 발행을 대기하고 있는 상태..
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                );
              }
              // 발행중..
              return Text('${snapShot.data}');
            },
          ),
        )
    );
  }
}