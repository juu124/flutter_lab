class SuperClass {
  String name;
  int age;

  SuperClass(this.name, this.age) {}
  SuperClass.one(this.name, this.age) {}
}

class SubClass extends SuperClass {
  SubClass(String name, int age): super(name, age) {}
  SubClass.name(String name, int age): super.one(name, age) {}

  // 하위 생성자의 매개변수를 상위 생성자에 전달해서 멤버 초기화를 진행한다.
  // 위 스타일대로 구현해도 되고
  // 아래처럼 작성해도 된다.
  // 하위 생성자 매개변수에 직접 상위 super.name으로 멤버 초기화는 상위 default 생성자만 호출 가능하다.
  SubClass.name2(super.name, super.age);
}