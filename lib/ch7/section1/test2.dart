import 'package:flutter/material.dart';

//InheritedWidget, 동일 상태를 이용하는 자손들의 공통의 조상..

void main() => runApp(MyApp());

//InheritedWidget 은 자체 rebuild 능력이 없다.
//단지 자손들이 공통으로 접근할 수 있는 상위 역할을 할 뿐이다.
//InheritedWidget 의 데이터 변경시 자손들이 rebuild 되게 하려면
//상위를 Stateful 로 만들어 InheritedWidget 을 rebuild 되게 해주어야 한다.
class MyInheritedWidget extends InheritedWidget {
  // int count = 0;//상태 데이터 가정.. 자손들이 공통으로 이용하는 데이터 가정..
  //
  // //나를 생성한 곳이 나의 부보가 되고.. 생성자 매개변수에 지정한 위젯이 나의 자식이 된다..
  // MyInheritedWidget(child): super(child: child);
  //
  // //자손에서 호출할 함수.. 상태를 변경하기 위한 함수..
  // increment(){
  //   print('increment... $count');
  //   count++;
  // }

  final int count;
  final Function increment;

  const MyInheritedWidget({
    required this.count,
    required this.increment,
    required super.child,
  });

  //나의 상태가 변경되었다면.. 상태를 이용하는 자손 위젯이 update 되어야 하는가?
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;//true - updae, false - 변경되지 않는다..
  }

  //static, 함수명은 마음대로.. 일반적으로 관습상 of
  //자손들이 이 객체를 획득하기 위해서 호출한다..
  //자손이 객체를 생성하는 것이 아니라.. 이미 생성된 객체를 타입으로만 명시해서 획득..
  //리턴 타입은 이 클래스 타입..
  static MyInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Inherited Test'),),
//         body: MyInheritedWidget(TestWidget()),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;

  void _increment() {
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Inherited Test')),
        body: MyInheritedWidget(
          count: _count,
          increment: _increment,
          child: TestWidget(),
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sub1(),
        Sub2()
      ],
    );
  }
}

class Sub1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    int count = MyInheritedWidget.of(context)!.count;
    return Text('I am Sub1, $count');

  }
}

class Sub2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Function increment = MyInheritedWidget.of(context)!.increment;
    return Row(
      children: [
        Text('I am Sub2'),
        ElevatedButton(onPressed: (){
          increment();
        }, child: Text('increment'))
      ],
    );

  }
}