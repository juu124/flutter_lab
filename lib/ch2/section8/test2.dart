// 추상 클래스.........
abstract class User {
  // 추상 함수. 함수 body를 가지지 않는 함수
  // 추상 함수를 가지는 클래스는 추상 클래스로 선언되어야 한다.
  void some();
}

class Customer extends User {
  // 추상 클래스를 상속받은 하위 클래스는 상위의 추상 함수를 오버라이드 받거나,
  // 자신을 추상형으로 선언햐야한다.
  @override
  void some() {

  }
}

class User2 {
  int no;
  String name;

  User2(this.no, this.name);
  String sayHello() {
    return 'hello $name, $no';
  }
}

// 클래스를 상속으로
class MySubClass extends User2 {
  MySubClass(super.name, super.no);
}

// 클래스를 인터페이스로
// 클래스를 인터페이스로 이용하면, 클래스에 선언된 모든 멤버가 추상형으로 인지된다.
// 모두 오버라이드 되어야한다.
class MyClass implements User2 {
  int no = 10;
  String name = "hello";
  @override
  String sayHello() {
    return "hello";
  }
}