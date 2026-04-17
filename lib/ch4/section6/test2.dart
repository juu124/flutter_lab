import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TabScreen());
  }
}

class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {
  int currentIndex = 0; // 상태 데이터. 유저가 선택한 탭 버튼의 index..

  List<Map<String, dynamic>> tabs = [
    {'label': 'Tab A', 'color': Colors.red},
    {'label': 'Tab B', 'color': Colors.green},
    {'label': 'Tab C', 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('indexed tab')),
      body: Column(
        children: [
          // 상단 탭 버튼 영역
          Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = index == currentIndex;
              return Expanded(
                // weight 같은 속성
                // 등분으로..
                child: GestureDetector(
                  onTap: () => setState(() {
                    currentIndex = index;
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? tabs[index]['color'] : Colors.grey,
                    ),
                    child: Text(
                      tabs[index]['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          // 선택된 탭에 따른 컨텐츠 화면
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: tabs.map((tab) {
                return Container(color: tab['color']);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
