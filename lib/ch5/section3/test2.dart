// tab
// tab화면을 만드는 방법은 여러가지가 있다.
// Scaffold - bottom navigation bar를 이용하기
//          - tab button 이 화면 하단에 위치
// TabBar(button) - TabBarView(content) : tab : button 임의 위치에
// IndexedStack - customizing이 용이하다.
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(),
    );
  }
}

// tab 화면 전환 애니메이션 효과를 위해서, 위리가 자체적으로 state를 제어하지 않아도 stateful 로
class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabScreenState();
  }
}

// SingleTickerProviderStateMixin - 애니메이션 효과 정보
class TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
  // TabBar - TabBarView 가 동일 controller 로 연결
  // 코드로 이벤트 처리하지 않아도.. controller에 의해 button 클릭.. 특정 화면 출력
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // tab button
        title: Text('TabBar test'),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: 'One',),
            Tab(text: 'Two',),
            Tab(text: 'Three',),
          ],
        ),
      ),
      body: TabBarView( // tab content..
        controller: controller,
        children: [
          Center(
            child: Text('One', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          Center(
            child: Text('Two', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          Center(
            child: Text('Three', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}