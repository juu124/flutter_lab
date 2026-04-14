class MyClass {
  // 자동으로 객체 생성이 안된다. 꼭 코드에서 객체를 생성해서 리턴해야 한다.
  // factory MyClass() {}

  // factory에서 리턴시키기 위한 생성자를 만들어야한다.
  // 오버로딩은 안되니까 이름을 명시해야한다.
  MyClass._instance();  // 내부에서만 사용할 수 있게 언더바 이름

  factory MyClass() {
    // factory 클래스는 null을 리턴 시킬 수 없다.
    // return null; // error

    // 클래스 타입의 객체만 리턴 가능하다.
    // 개발자 코드를 리턴시켜야하는 것은 맞지만 아무거나 리턴시킬 수 없다.
    // return 'hello';   // error

    // 자신의 클래스 타입의 객체를 준비해서 리턴한다.
    return MyClass._instance();
  }
}

// singleton 구현..........
// 어느 클래스의 객체가 단 하나만 생성되어 이용되게 한다.
class MySingleton {
  static final MySingleton _instance = MySingleton._internal();

  // 리턴할 생성자 준비
  MySingleton._internal();

  factory MySingleton() {
    return _instance;
  }
}

// 캐싱 알고리즘
// 이 클래스 객체가 생성되면서 이미지 로딩이 되어야 하는데 퍼포먼스에 부담되는 작업이다.
// 신규 이미지는 작업을 통해 새로운 객체를 생성한다.
// 기존의 이미지는 캐싱했다가 작업 없이 그대로 이용하게 한다.
class Image {
  late String url;

  static Map<String, Image> _cache = <String, Image> {};

  Image._instance(this.url);

  factory Image(String url) {
    // 동일한 이미지 여부 확인
    if(_cache[url] == null) {
      // 캐싱된 것이 없다.
      var obj = Image._instance(url);
      _cache[url] = obj;
    }
    // 동일한 이미지라면 캐시에 저장되어있는 이미지 객체 리턴
    return _cache[url]!;
  }
}

// const constructor...............
class MyClass2 {
  // 이 클래스내에 const 생성자가 있다면,
  // 이 클래스의 모든 멤버 변수는 final 로 선언해야한다.
  final int data;
  const MyClass2(this.data);
}


main() {
  MyClass();

  var obj1 = MySingleton();
  var obj2 = MySingleton();
  print(obj1 == obj2);  // true

  var image1 = Image('a.jpg');
  var image2 = Image('a.jpg');
  print(image1 == image2);  // true
  var image3 = Image('b.jpg');
  print(image1 == image3);  // false

  // 객체 두번 생성, 동일 매개변수로
  // ==> 객체가 두개 생성되었다.
  var obj3 = MyClass2(10);
  var obj4 = MyClass2(10);
  print(obj3 == obj4);  // false - 객체가 서로 다르다. 두개 생성되었다는 것.

  var obj5 = const MyClass2(10);
  var obj6 = const MyClass2(10);
  print(obj5 == obj6);  // true

  var obj7 = const MyClass2(10);  // const를 붙이고 매개변수가 같다면 같은 객체를 리턴 하지만, (이미생성되어있네?)
  var obj8 = const MyClass2(20);  // const를 붙이고 매개변수가 다르다면 새로운 객체를 리턴한다.
  print(obj7 == obj8);  // false
}