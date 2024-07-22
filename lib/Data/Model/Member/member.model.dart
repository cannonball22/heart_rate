import 'dart:convert';

class Member {
  String id;
  String email;
  String fullName;
  //
  //
  Member({
    required this.id,
    required this.fullName,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullName': fullName,

    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['id'] as String,
      email: map['email'],
      fullName: map['fullName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) =>
      Member.fromMap(json.decode(source) as Map<String, dynamic>);
}
