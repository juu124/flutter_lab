// 형제들끼리 상태 공유
// 부모에 상태 유지, 부모에서 상태 변경..
// 자식 생성자를 이용해서 전달하기
import 'package:flutter/material.dart';

void main() => runApp(ParentWidget());

// 부모 위젯에서 상태가 발생(변경) 되지 않으며, 부모 위젯에서 상태를 이용(화면 출력)하지 않는다.
// 공통의 자식들이 변경, 이용하기 위해서 부모를 stateful 로 .. 만들었다. (위의 이유라면 Stateless 로 만들어야 함에도 불구하고)
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  // 상태..
  bool favorited = false;
  int favoriteCount = 10;

  //  상태 변경 함수
  void toggle() {
    setState(() {
      if (favorited) {
        favoriteCount -= 1;
        favorited = false;
      } else {
        favoriteCount += 1;
        favorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('state test'),),
        body: Column(
          children: [
            IconWidget(favorited: favorited, onChanged: toggle,), //  생성자 매개변수로 넣은 값이 부모위젯에 선언된 상태와 함수
            ContentWidget(favoritedCount: favoriteCount,)
          ],
        ),
      )
    );
  }
}

class IconWidget extends StatelessWidget {
  bool favorited;
  Function onChanged;

  // 부모가 자신을 생성하면서 전달하는 매개변수로 상태를 이용, 상태를 변경
  IconWidget({this.favorited = false, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () { onChanged(); },
        icon: (favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
    );
  }
}

class ContentWidget extends StatelessWidget {
  int favoritedCount;
  ContentWidget({required this.favoritedCount});

  @override
  Widget build(BuildContext context) {
    return Text('$favoritedCount');
  }
}