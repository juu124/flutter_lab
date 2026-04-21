import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
        '/three': (context) => ThreeScreen(),
      },
      onGenerateRoute: (settings){//어디선가 pushNamed() 호출시 자동 호출..매개변수는 전환 요청 정보(이름, argument)
        if(settings.name == '/four'){
          //처리할 업무로직 처리하고..
          //화면 전환시키려면.. Route 를 리턴..
          return MaterialPageRoute(
              builder: (context) => FourScreen(),
              settings: settings//정보 그대로 유지..
          );
        }
      },
    );
  }
}

//data class, 화면 전환시 전달할 데이터..
class User {
  String name;
  String address;
  User(this.name, this.address);
}

//화면 단위 위젯..
class OneScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OneScreen'),),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OneScreen', style: TextStyle(color: Colors.white, fontSize: 30),),
              ElevatedButton(
                onPressed: () async {
                  //화면전환 한다.. 결과값 되돌려 받는다..
                  final result = await Navigator.pushNamed(
                      context,
                      '/two',
                      arguments: {
                        "arg1": 10,
                        "arg2": "hello",
                        "arg3": User('kim','seoul')
                      }
                  );
                  print('result : ${(result as User).name}');
                },
                child: Text('Go Two'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TwoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //화면 전환시 전달된 데이터 획득..
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(title: Text('TwoScreen'),),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TwoScreen', style: TextStyle(color: Colors.white, fontSize: 30),),
              Text('arg data : ${args['arg1']}, ${args['arg2']}, ${(args['arg3'] as User).name}'),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/three');
                },
                child: Text('Go Three'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, User('lee', 'busan'));
                },
                child: Text('pop'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThreeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ThreeScreen'),),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ThreeScreen', style: TextStyle(color: Colors.white, fontSize: 30),),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/four');
                },
                child: Text('Go Four'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('pop'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FourScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FourScreen'),),
      body: Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('FourScreen', style: TextStyle(color: Colors.white, fontSize: 30),),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('pop'),
              )
            ],
          ),
        ),
      ),
    );
  }
}