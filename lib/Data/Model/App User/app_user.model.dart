import 'dart:convert';

class AppUser {
  String id;
  String email;
  String fullName;

  // New attributes
  int age;
  int sleepDuration;
  int height;
  int weight;
  String occupation;
  String physicalActivity;
  String isAthlete;
  String stressLevel;

  AppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.age,
    required this.sleepDuration,
    required this.height,
    required this.weight,
    required this.occupation,
    required this.physicalActivity,
    required this.isAthlete,
    required this.stressLevel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullName': fullName,
      'age': age,
      'sleepDuration': sleepDuration,
      'height': height,
      'weight': weight,
      'occupation': occupation,
      'physicalActivity': physicalActivity,
      'isAthlete': isAthlete,
      'stressLevel': stressLevel,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      email: map['email'],
      fullName: map['fullName'],
      age: map['age'],
      sleepDuration: map['sleepDuration'],
      height: map['height'],
      weight: map['weight'],
      occupation: map['occupation'],
      physicalActivity: map['physicalActivity'],
      isAthlete: map['isAthlete'],
      stressLevel: map['stressLevel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
