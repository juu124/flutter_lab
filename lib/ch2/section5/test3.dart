int plus(int no) {
  return no + 10;
}

int multiply(int no) {
  return no * 10;
}

// hof(high order function : 고차함수) : 다른 함수를 매개변수로, 리턴값으로 이용하는 함수
// Function 으로 선언하면 모든 함수
// 함수 타입을 한정 짓고 싶다면
// Function testFun(Function argFun) {}
// Function testFun(int Function(int) argFun) {}

// 아래처럼 선언도 가능
Function testFun(int argFun(int a)) {
  print(argFun(10));
  return multiply;
}

String _name = "kim";
// getter 함수.. get예약어로 선언. 함수인데 ()는 가질 수 없다.
String get name {
  return _name.toUpperCase();
}

// setter 함수.. set 예약어로 선언.. 매개변수 하나
set name(value) {
  _name = value;
}

main() {
  // var result = testFun(plus);
  var result = testFun((int a) {
    return a * 20;
  }); // 익명 함수로 함수를 전달
  print("result : ${result(20)}");

  // getter/setter 함수는 변수처럼 이용
  name = "lee";
  print("name : $name"); // name : Lee
}
