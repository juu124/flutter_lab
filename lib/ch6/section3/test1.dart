import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Future 를 이용하겠다.
// 미래에 발생하는 데이터.. 그 데이터가 발생하는 시점에 화면을 업데이트 하겠다.
// 우리의 위젯이.. 화면 업데이트 때문에 상태를 유지해야 하고 StatefulWidget으로 만들어야 하는데..
// FutureBuilder를 이용해 Future 데이터를 화면에 출력함으로 우리의 위젯은 StatelessWidget
class MyApp extends StatelessWidget {
  // 시간이 오래 걸리는 업무가 있다고 rkwjd
  Future<String> sum() {
    return Future.delayed(Duration(seconds: 5), () {
      // delayed 생성자는 첫번째 매개변수 시간 후에 두번째 함수 호출한다.
      return 'finish';
    });
  }

  Future<int> funA() {
    return Future.delayed(Duration(seconds: 3), () {
      return 10;
    });
  }

  Future<int> funB(int arg) {
    return Future.delayed(Duration(seconds: 2), () {
      return arg * arg;
    });
  }

  // 함수 선언위치 async : async 예약어로 선언된 함수는 자동으로 Funture 객체를 리턴하게 되어 있다.
  // Future() 생성자에 추가하는 시간이 오래 걸리는 함수 업무를 async 함수에 그래도 작성..
  Future<int> calFun() async {
    // funA()를 호출하고, 그 결과로 funB()를 호출해서 결과를 리턴한다고 가정..
    // 전체적으로 5초가 걸리는 업무다
    int aResult =
        await funA(); // await는 async로 선언된 함수 내부에서.. Future의 실제 데이터를 획득하기 위한 예약어
    // Future.then()의 축약형..
    int bResult = await funB(aResult);
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('future test')),
        body: Column(
          children: [
            FutureBuilder(
              // Future 데이터를 활용하는 위젯
              future: sum(), // Future 데이터를 지정한다. sum의 리턴타입이 Future
              builder: (context, snapshot) {
                // 최초 한번 호출된다. 그 후 실제 Future 의 실 데이터 발생하는 순간 호출된다.
                // 두 번째 매개변수가 데이터이다.
                if (snapshot.hasData) {
                  return Center(child: Text('${snapshot.data}'));
                }
                return Center(child: Text('waiting...'));
              },
            ),
            FutureBuilder(
              future: calFun(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text('${snapshot.data}'));
                }
                return Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
