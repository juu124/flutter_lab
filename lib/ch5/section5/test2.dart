import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 접히는 앱바를 사용하려면 Scaffold의 appbar 사용하지 않고 body에서 CustomScrollView..
        // CustomScrollView - 하위 위젯들의 스크롤 정보 통합 관리..
        // CustomScrollView 을 이용하면 하위 위젯들은 SliverXXX 위젯만 가능하다.
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.expand)),
              expandedHeight: 200,
              floating: true, // 나타날때 처음부터(true)? 맨 마지막에 (false)
              pinned: false,  // 다 사라지는가(true)? 한 줄은 남길거니(false)
              snap: true, // floating 이 true인 경우에만 의미가 있다. 나타날때 살짝 스크롤에 의해 전체 나타난다.
              elevation: 50,
              backgroundColor: Colors.pink,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/big.jpeg'), fit: BoxFit.fill)
                ),
              ),
              title: Text('AppBar Title'),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
              ],
            ),
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'),);
                }),
                itemExtent: 50.0
            )
          ],
        ),
      ),
    );
  }
}