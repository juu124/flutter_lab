class User {
  late String name;
  late int age;

  // case 1
  // User(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  // case 2
  // User(this.name, this.age);

  // case 3
  // User(String name, int age): this.name = name, this.age = age;

  // 생성자 초기화 영역을 이용해 멤버 초기화를 하는 경우는.. 매개변수값을 활용해 약간의 로직을 실행한 후 초기화 할 때
  static int calFun(int arg) {
    return arg * 10;
  }
  User(String name, int age) : this.name = name.toUpperCase(), this.age = calFun(age);


  sayHello() {
    print("name : $name, age : $age");
  }
}

main() {
  User('kim', 20).sayHello();
}