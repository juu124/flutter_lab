// 서버 네트워킹 json 데이터 추상화 dto
import 'package:json_annotation/json_annotation.dart';

// part : 같은 dart 파일의 내용을 파일만 분리시켜서 작성
part 'user.g.dart';

// > dart run build_runner build
// build runner에 의해 json_serializable 이 구동된다.
// json_serializable : 이 프로젝트 내에 있는 @JsonSerializable() 어노테이션이 추가된 클래스를 보고..
// 코드를 자동으로 만들어 버린다.
@JsonSerializable()
class User {
  String name;
  int age;
  // 만약 json 의 키와 변수명이 다르다면.. 어노테이션으로 명시하면된다.
  @JsonKey(name: 'email_address')
  String email;

  User({required this.name, required this.age, required this.email});

  // fromJson 생성자, toJson 함수..
  // json_serializable에 의해 자동으로 만들어지게 하고 싶다..
  // annotation 추가..
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}