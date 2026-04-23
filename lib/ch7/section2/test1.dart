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

// 클래스 Counter를 참조해서 만들어야하는 상태가 있을 수 있다.
// provider를 이용해 공개해야하는 상태 데이터.. 다른 상태 데이터 참조해서
// 이때 Sum 상태를 등록하려면 ProxyProvider를 사용하면된다.
class Sum {
  int _sum = 0;   // _ : 외부에서 접근할 수 없음

  int get sum => _sum;

  void set sum(value) {
    _sum = 0;
    for (var i = 1; i <= value; i++) {
      _sum += i;
    }
  }

  Sum(Counter counter) {
    sum = counter.count;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('provider test')),
        body: MultiProvider(
            providers: [
              ChangeNotifierProvider<Counter>.value(
                value: Counter(),
              ),
              Provider<int>.value(value: 10,),
              Provider<String>.value(value: 'hello',),
              // ProxyProvider 제네릭 타입 첫 번째 : 내가 받아야하는 상태 타입
              // ProxyProvider 제네릭 타입 두 번째 : 내가 발행하는 상태 타입
              ProxyProvider<Counter, Sum> (
                // model : 내가 참조해야하는 다른 상태
                // sum : 내가 이전에 발행했던 객체
                update: (context, counter, sum) {
                  if (sum != null) {
                    sum.sum = counter.count;
                    return sum;
                  } else {
                    return Sum(counter);
                  }
                },
              ),
            ],
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

    var int_data = Provider.of<int>(context);
    var string_data = Provider.of<String>(context);

    var sum = Provider.of<Sum>(context);

    return Column(
      children: [
        Text('provider counter : ${counter.count}'),
        ElevatedButton(
          onPressed: () {
            counter.increment();
          },
          child: Text('increment'),
        ),
        Text('provider int : $int_data'),
        Text('provider string : $string_data'),
        Text('provider sum : ${sum.sum}'),
      ],
    );
  }
}
