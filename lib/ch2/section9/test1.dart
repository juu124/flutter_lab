mixin MyMixin {
  int data = 10;
  void myFun() {}

  // mixin 은 클래스가 아니다.
  // 생성자를 추가할 수 없다.
  // MyMixin() {}
}

class MyClass with MyMixin {
  void some() {
    data++;
    myFun();
  }
}

main() {
  var obj = MyClass();

  // error .. 객체 생성해서 사용 불가하다
  // var obj1 = MyMixin();
}