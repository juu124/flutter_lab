class MyClass {
  int data;
  MyClass(this.data) {}
  // 생성자 오버로딩(동일이름의 생성자 여러개) 지원하지 않는다.
  // 그래서 동일 이름의 생성자를 여러개 만들 수 없다.
  // 생성자를 여러개 선언하려면 각각의 이름을 명시한다.(named constructor)
  MyClass.one(this.data);
  MyClass.two(this.data);
}

class MyClass2 {
  int data = 0;
  MyClass2(int data1, int data2) {
    print("MyClass2() call....");
  }
  // error 초기화 영역에서 다른 생성자를 호출 (this(), super()) 이면, {}을 가질 수 없다.
  // MyClass2.one(int arg): this(arg, 0) {}

  // error 다른 생성자 호출(this(arg, 0))과 멤버 초기화(this.data = arg)를 같이 사용할 수 없다.
  // MyClass2.one(int arg): this(arg, 0), this.data = arg;

  MyClass2.one(int arg): this(arg, 0);  // ok
  MyClass2.two(): this.one(0);
}

main() {
  var obj1 = MyClass(10);
  var obj2 = MyClass.one(20);
  var obj3 = MyClass.two(30);
  print("obj1 : ${obj1.data}, ${obj2.data}, ${obj3.data}");   // 10, 20, 30
}