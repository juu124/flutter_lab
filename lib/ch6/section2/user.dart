// dto
// 백엔드 데이터
class User {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  // 생성자
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  // 수작업으로 JSON 유저데이터 넘어오면 객체화
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }
}
