import 'dart:convert';

import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/if.dart';

class UserModel {
  final String course;
  final String name;
  final String photoUrl;
  final String id;
  final int age;
  final Degree degree;
  final If ifce;

  UserModel({
    required this.course,
    required this.name,
    required this.photoUrl,
    required this.id,
    required this.age,
    required this.degree,
    required this.ifce,
  });

  UserModel copyWith({
    String? course,
    String? name,
    String? photoUrl,
    String? id,
    int? age,
    Degree? degree,
    If? ifce,
  }) {
    return UserModel(
      course: course ?? this.course,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      id: id ?? this.id,
      age: age ?? this.age,
      degree: degree ?? this.degree,
      ifce: ifce ?? this.ifce,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'name': name,
      'photoUrl': photoUrl,
      'id': id,
      'age': age,
      'degree': Degree.values.indexOf(degree),
      'ifce': If.values.indexOf(ifce),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      course: map['course'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      id: map['id'] ?? '',
      age: map['age']?.toInt() ?? 0,
      degree: Degree.values[map['degree']],
      ifce: If.values[map['ifce']],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(course: $course, name: $name, photoUrl: $photoUrl, id: $id, age: $age, degree: $degree, ifce: $ifce)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.course == course &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.id == id &&
        other.age == age &&
        other.degree == degree &&
        other.ifce == ifce;
  }

  @override
  int get hashCode {
    return course.hashCode ^
        name.hashCode ^
        photoUrl.hashCode ^
        id.hashCode ^
        age.hashCode ^
        degree.hashCode ^
        ifce.hashCode;
  }
}
