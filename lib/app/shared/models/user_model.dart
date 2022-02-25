import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/gender.dart';
import 'package:ifchat/app/shared/enums/orientation.dart';
import 'package:ifchat/app/shared/utils/utils.dart';

class UserModel {
  final String course;
  final String name;
  final List<String> photos;
  final String id;
  final DateTime birth;
  final Degree degree;
  final Campus campus;
  final Gender gender;
  final Orientation orientation;

  UserModel({
    required this.course,
    required this.name,
    required this.photos,
    required this.id,
    required this.birth,
    required this.degree,
    required this.campus,
    required this.gender,
    required this.orientation,
  });

  UserModel copyWith({
    String? course,
    String? name,
    List<String>? photos,
    String? id,
    DateTime? birth,
    Degree? degree,
    Campus? campus,
    Gender? gender,
    Orientation? orientation,
  }) {
    return UserModel(
      course: course ?? this.course,
      name: name ?? this.name,
      photos: photos ?? this.photos,
      id: id ?? this.id,
      birth: birth ?? this.birth,
      degree: degree ?? this.degree,
      campus: campus ?? this.campus,
      gender: gender ?? this.gender,
      orientation: orientation ?? this.orientation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'name': name,
      'photos': photos,
      'id': id,
      'birth': birth.millisecondsSinceEpoch,
      'degree': Degree.values.indexOf(degree),
      'campus': Campus.values.indexOf(campus),
      'gender': Gender.values.indexOf(gender),
      'orientation': Orientation.values.indexOf(orientation),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      course: map['course'] ?? '',
      name: map['name'] ?? '',
      photos: List<String>.from(map['photos']),
      id: map['id'] ?? '',
      birth: DateTime.fromMillisecondsSinceEpoch(map['birth']),
      degree: Degree.values[map['degree']],
      campus: Campus.values[map['campus']],
      gender: Gender.values[map['gender']],
      orientation: Orientation.values[map['orientation']],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(course: $course, name: $name, photos: $photos, id: $id, birth: $birth, degree: $degree, campus: $campus, gender: $gender, orientation: $orientation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.course == course &&
        other.name == name &&
        listEquals(other.photos, photos) &&
        other.id == id &&
        other.birth == birth &&
        other.degree == degree &&
        other.campus == campus &&
        other.gender == gender &&
        other.orientation == orientation;
  }

  @override
  int get hashCode {
    return course.hashCode ^
        name.hashCode ^
        photos.hashCode ^
        id.hashCode ^
        birth.hashCode ^
        degree.hashCode ^
        campus.hashCode ^
        gender.hashCode ^
        orientation.hashCode;
  }

  int get age =>
      Utils.abs(birth.difference(DateTime.now()).inDays ~/ 365) as int;
}
