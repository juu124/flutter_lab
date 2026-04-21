// json 데이터 추상화 DTO 클래스를 만들때..
// fromJson, toJson() 생성자 함수를 자동으로 만들어주는 패키지이다.
// json_serializable
// runtime 패키지 아니다. 개발자 도구이다. dev package이다.
// code generator

// test1.dart에 있는 아래 코드들을 자동으로 만들어주는 것이다.
// Todo.fromJson(Map<String, dynamic> json)
//     : id = json['id'],
//       title = json['title'],
//       complete = json['complete'];
//
//   // 객체 -> Map -> jsonEncode() -> 문자열
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'title': title,
//     'complete': complete,
//   };