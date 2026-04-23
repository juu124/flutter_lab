import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 상태 선언..
// 데이터와 데이터 변경 함수..
class Counter with ChangeNotifier {
  int count = 0; // 하위 위젯들이 이용하는 데이터..

  void increment() {
    // 하위에서 필요한 순간 호출하는 함수..
    count++;
    notifyListeners(); // 이 값을 이용하는 하위 위젯 rebuild (이게 없으면 변경된 값이 적용되지 않는다.)
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('provider test')),
        body: ChangeNotifierProvider<Counter>.value(
          value: Counter(),
          child: SubWidget(),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 상위에 선언된 provider 상태 획득... 타입으로 식별해서..
    var counter = Provider.of<Counter>(context);

    return Column(
      children: [
        Text('provider counter : ${counter.count}'),
        ElevatedButton(
          onPressed: () {
            counter.increment();
          },
          child: Text('increment'),
        ),
      ],
    );
  }
}
