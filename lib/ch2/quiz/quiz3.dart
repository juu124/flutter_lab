abstract class Describable {
  String get description;
  String describe();
  String get shortDescription => "[${describe()}]";
}

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);
  String sound() => "...";
  String toString() => "Animal(name=$name, age=$age)";
}

class Dog extends Animal implements Describable {
  String breed;
  Dog(super.name, super.age, this.breed);
  Dog.nameAge(String name, int age) : this(name, age, "믹스견");
  Dog.name(String name) : this(name, 0, "알 수 없음");

  @override
  String sound() => "멍멍!";

  @override
  String get description => "이름: $name | 품종: $breed | 나이: $age살";

  @override
  String describe() => "강아지 $name (품종: $breed)";

  @override
  String get shortDescription => throw UnimplementedError();
}