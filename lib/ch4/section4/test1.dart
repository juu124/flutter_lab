import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container test'),),
        body: Container(
          width: Size.infinite.width,
          height: Size.infinite.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.yellow],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.asset('images/big.jpeg', width: 100,),
                ),

                // Container 는 Padding, Align 등 다양한 위젯 설정의 wrapper 이다.
                // Padding은 있다. Margin 은 따로 없다.
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset('images/big.jpeg', width: 100,),
                    ),
                  ),
                ),
                // crop...
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('images/big.jpeg'),
                      fit: BoxFit.cover,
                    )
                  ),
                  width: 100,
                  height: 100,
                ),
                // 이미지 동그랗게 출력하고 싶은게 목적이다? 아래처럼 해보자
                // CircleAvatar는 이미지만 된다.
                CircleAvatar(
                  backgroundImage: AssetImage('images/big.jpeg'),
                  radius: 50,
                ),
                // 동그랗게 나오게 하고 싶다.. 모든 위젯을..
                ClipOval(
                  child: Image.asset(
                    'images/big.jpeg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                // round rect...
                // 위젯, 이미지 모두 둥글게 처리할 수 있다.
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/big.jpeg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}