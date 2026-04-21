import 'package:flutter/material.dart';

//MainScreen -> UserMain -> UserSub1 -> UserSub2
//           -> ProductMain -> ProductSub1 -> ProductSub2

//UserSub2 -> MainScreen(Home 이동)
//UserSub2 -> ProductMain(user 화면을 스텍에서 제거시켜서)


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //add.............................
      initialRoute: '/',
      routes: {
        //계층 구조 등록이 안된다.. 이름이 계속 중복..
        '/': (context) => MainScreen(),
        '/user': (context) => UserMain(),
        '/user/sub1': (context) => UserSub1(),
        '/user/sub2': (context) => UserSub2(),
        '/product': (context) => ProductMain(),
        '/product/sub1': (context) => ProductSub1(),
        '/product/sub2': (context) => ProductSub2(),
      },

    );
  }
}

// 공통 네비게이션 버튼 (스택 유지 이동)
Widget _navButton(BuildContext context, String label, String route) {
  return ElevatedButton(
    onPressed: () => Navigator.pushNamed(context, route),
    child: Text(label),
  );
}

// ============================================================
// MainScreen
// ============================================================
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MainScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MainScreen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            _navButton(context, 'UserMain 으로 이동', '/user'),
            SizedBox(height: 12),
            _navButton(context, 'ProductMain 으로 이동', '/product'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// UserMain
// ============================================================
class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UserMain')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('UserMain', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            _navButton(context, 'UserSub1 으로 이동', '/user/sub1'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// UserSub1
// ============================================================
class UserSub1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UserSub1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('UserSub1', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            _navButton(context, 'UserSub2 으로 이동', '/user/sub2'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// UserSub2 - MainScreen, ProductMain 으로 이동 시 스택 초기화
// ============================================================
class UserSub2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UserSub2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('UserSub2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                //add...............................
                //MainScreen 만 남기고 스택에서 모든 정보 제거..
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('MainScreen 으로 이동'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                //add..........................
                //user 와 관련된 화면은 제거 후, product 화면으로 이동..
                Navigator.pushNamedAndRemoveUntil(context, '/product', ModalRoute.withName('/'));
              },
              child: Text('ProductMain 으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ProductMain
// ============================================================
class ProductMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProductMain')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ProductMain', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            _navButton(context, 'ProductSub1 으로 이동', '/product/sub1'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ProductSub1
// ============================================================
class ProductSub1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProductSub1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ProductSub1', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            _navButton(context, 'ProductSub2 으로 이동', '/product/sub2'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ProductSub2 - MainScreen, UserMain
// ============================================================
class ProductSub2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProductSub2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ProductSub2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                //add............................
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('MainScreen 으로 이동'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                //add...........................
                Navigator.pushNamedAndRemoveUntil(context, '/user', ModalRoute.withName('/'));
              },
              child: Text('UserMain 으로 이동'),
            ),

          ],
        ),
      ),
    );
  }
}
