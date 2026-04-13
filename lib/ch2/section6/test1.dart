class User {
  String? name;
  int? age;
  some() {

  }
}

main() {
  // ~/ 연산자... 나누기 연산에 의한 결과가 실수라고 하더라도 소수점을 버리고 정수로 결과 값이 나온다.
  int a = 8;
  print(' a / 5 = ${a / 5}');     //  a / 5 = 1.6
  print(' a ~/ 5 = ${a ~/ 5}');   //  a ~/ 5 = 1

  // casting ....
  // Object : dart 의 최상의 타입...
  Object obj = User(); // 하위 -> 상위 : 암시적 캐스팅...
  // obj.some();   // error... User 객체이지만, Object 타입으로 이용된다. Object 에는 some() 함수가 없다.

  if(obj is User) { // is - type check 연산자.. true 가 나오면 smart casting..
    // 결과 값은 true가 나올 것이다.
    obj.some(); // is를 거처가면서 자동 캐스팅이 된다.
  }

  (obj as User).some(); // 명시적 캐스팅

  // cascade operator ...........................
  // 편해서 많이 사용한다.
  var user = User();
  user.name = 'lee';
  user.age = 20;
  user.some();

  // 동시에 객체의 멤버에 반복적으로 접근하는 경우
  // 위 코드처럼 객체명을 계속 이용해도 되기는 하지만
  // 아래처럼 캐스캐이드 연산자 이용
  User()
    ..name = "lee"
    ..age = 30
    ..some();

  // 예외 전파.. 자신을 호출한 곳에 예외를 발생시키기...
  // throw..
  some() {
    // throw Exception("예외 발생"); // Exception 객체를 던지면서 예의를 전파한다.
    // 일반 데이터를 던지면서... 예외 전파도 가능하다
    // throw "my Exception"; // 문자열 데이터
    throw User();
  }

  // 예외 처리구문....
  // on : 예외 타입을 명시해서 어떤 타입의 예외를 처리하겠다고 명시하는 것
  // 예외 객체는 필요 없는 경우
  try {
    some();
  } on FormatException {

  } on Exception {

  }

  // 예외 타입과.. 예외 객체가 모두 필요한 경우
  // on에 의해 타입이 결정되고, catch에 예외 객체가 전달
  try {
    some();
  } on FormatException catch(e) {

  } on Exception catch(e) {

  }

  // 타입은 필요 없고 예외 객체만 필요
  try {
    some();
  } catch(e) {

  }
}