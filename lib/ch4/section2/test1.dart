import 'package:flutter/material.dart';
import 'package:flutter_lab/ch3/section2/test1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // 화면은 별도로 빼는 방식을 실전에서도 많이 사용한다.
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  String longText = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text test',),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // 가로 방향으로 차지할 만큼 차지해라
        children: [
          Text(
            'Hello World',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.red,
              fontSize: 20,
              backgroundColor: Colors.yellow,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy
            ),
          ),

          SizedBox(height: 16,),

          Text(
            longText,
            style: TextStyle(fontSize: 20,),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),

          SizedBox(height: 16,),

          // 하나의 문자열 위젯에 나오는 문자열들의 상이한 스타일.. spannable 처리
          RichText(
            text: TextSpan( // TextSpan : 문자열 + style 조합
              // 상위에 정의된 스타일이 하위의 span 에 상속된다.
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(text: 'HE', style: TextStyle(color: Colors.red,),),
                TextSpan(text: 'L', style: TextStyle(fontStyle: FontStyle.italic,),),
                TextSpan(text: 'LO',),
                TextSpan(text: 'WO', style: TextStyle(color: Colors.blue,),),
                TextSpan(text: 'RLD', style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}