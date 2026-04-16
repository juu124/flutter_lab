import 'package:flutter/material.dart';
// 유저 이벤트 감지..
import 'package:flutter/gestures.dart';

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

  // 네트워킹을 통해서 검색 결과 신문 기사를 가져왔다고 가정하자..
  // 류현진 으로 검색했다고 가정
  // 검색 결과 신문 기사를 화면에 뿌려야 한다. 긴 문자열이지만, Text 로 뿌리면 된다.
  // 유저가 검색한 검색어를 UI 적으로 다르게 나오게 하고 싶다.
  // 검색어만 이벤트 처리되게..
  // 하나의 단일 위젯이다. 위젯 전체의 문자열이 아니라.. 위젯의 일부분의 문자열 UI 적으로 다르게
  // 위젯 일부분 문자열만 이벤트 처리가 되게 하고 싶다.
  // ==> 류현진 문자열만 링크 모양아로.. 류현진 문자열만 클릭 이벤트..

  //'', ""로 묶이는 문자열 결합은 근접 문자열인 경우 + 로 연결하지 않아도 자동 연결..
  String article = '토론토 블루제이의 류현진이 '
      '22024년 복귀했다. '
      '류현진은 기자회견에서, 어쩌구 저쩌구 이야기했다.';

  // TapGestureRecognizer : 유저 이벤트 등록.. 위젯의 이벤트 등록은 GestureRecognizer...
  // 위젯이 아닌 다른 클래스에서의 유저 이벤트를 감지하고.. 이벤트 발생시에 콜백 등록 역할..
  // TextSpan에 이벤트 등록할 때 이용.. TextSpan이 RichText 위젯에 포함되는 정보이지 위젯은 아니다.
  List<TapGestureRecognizer> recognizers = [];

  // 매개변수의 문자열을 문석해서.. 적절하게 TextSpan을 만들어서 리턴시키는 함수..
  List<TextSpan> buildTextSpans(String text) {
    const keyword = '류현진'; // 검색어로 가정..
    final spans = <TextSpan>[];
    // 전체 신문기사를 검색어로 자른다.
    final parts = text.split(keyword);
    print(parts);

    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        // 검색어로 잘린 문자열이다. 일반 문자열이다. 평온하게 출력
        spans.add(TextSpan(text: parts[i]));
      }
      // 검색어로 잘린 문자열의 앞 부분이 위에서 span 으로 추가..
      // 그 다음은 검색어를 원하는 style로 추가..
      if (i < parts.length - 1) {
        // 이벤트 처리 추가를 위해서..
        final recognizer = TapGestureRecognizer()
            ..onTap = () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('류현진 프로필 페이지로 이동합니다.'))
              );
            };
        recognizers.add(recognizer);
        // 검색어를 위한 span을 준비한다..
        spans.add(TextSpan(
          text: keyword,
          style: TextStyle(
            color : Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
          recognizer: recognizer,
        ));
      }
    }
    return spans;
  }

  @override
  void dispose() {
    super.dispose();
    for (final r in recognizers) r.dispose(); // 이벤트 등록 해제
  }


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

          SizedBox(height: 16,),

          RichText(
            text: TextSpan(
              // 전체 적용될 스타일..
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                height: 1.6,
              ),
              children: buildTextSpans(article),
            ),
          ),

        ],
      ),
    );
  }
}