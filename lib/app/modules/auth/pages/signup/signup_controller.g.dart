// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  Computed<List<String>>? _$coursesComputed;

  @override
  List<String> get courses =>
      (_$coursesComputed ??= Computed<List<String>>(() => super.courses,
              name: '_SignupControllerBase.courses'))
          .value;

  final _$isValidNameAtom = Atom(name: '_SignupControllerBase.isValidName');

  @override
  bool get isValidName {
    _$isValidNameAtom.reportRead();
    return super.isValidName;
  }

  @override
  set isValidName(bool value) {
    _$isValidNameAtom.reportWrite(value, super.isValidName, () {
      super.isValidName = value;
    });
  }

  final _$isValidEmailAtom = Atom(name: '_SignupControllerBase.isValidEmail');

  @override
  bool get isValidEmail {
    _$isValidEmailAtom.reportRead();
    return super.isValidEmail;
  }

  @override
  set isValidEmail(bool value) {
    _$isValidEmailAtom.reportWrite(value, super.isValidEmail, () {
      super.isValidEmail = value;
    });
  }

  final _$isValidPasswordAtom =
      Atom(name: '_SignupControllerBase.isValidPassword');

  @override
  bool get isValidPassword {
    _$isValidPasswordAtom.reportRead();
    return super.isValidPassword;
  }

  @override
  set isValidPassword(bool value) {
    _$isValidPasswordAtom.reportWrite(value, super.isValidPassword, () {
      super.isValidPassword = value;
    });
  }

  final _$isValidBirthDateAtom =
      Atom(name: '_SignupControllerBase.isValidBirthDate');

  @override
  bool get isValidBirthDate {
    _$isValidBirthDateAtom.reportRead();
    return super.isValidBirthDate;
  }

  @override
  set isValidBirthDate(bool value) {
    _$isValidBirthDateAtom.reportWrite(value, super.isValidBirthDate, () {
      super.isValidBirthDate = value;
    });
  }

  final _$selectedCampusAtom =
      Atom(name: '_SignupControllerBase.selectedCampus');

  @override
  If get selectedCampus {
    _$selectedCampusAtom.reportRead();
    return super.selectedCampus;
  }

  @override
  set selectedCampus(If value) {
    _$selectedCampusAtom.reportWrite(value, super.selectedCampus, () {
      super.selectedCampus = value;
    });
  }

  final _$selectedDegreeAtom =
      Atom(name: '_SignupControllerBase.selectedDegree');

  @override
  Degree get selectedDegree {
    _$selectedDegreeAtom.reportRead();
    return super.selectedDegree;
  }

  @override
  set selectedDegree(Degree value) {
    _$selectedDegreeAtom.reportWrite(value, super.selectedDegree, () {
      super.selectedDegree = value;
    });
  }

  final _$selectedCourseAtom =
      Atom(name: '_SignupControllerBase.selectedCourse');

  @override
  String get selectedCourse {
    _$selectedCourseAtom.reportRead();
    return super.selectedCourse;
  }

  @override
  set selectedCourse(String value) {
    _$selectedCourseAtom.reportWrite(value, super.selectedCourse, () {
      super.selectedCourse = value;
    });
  }

  final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase');

  @override
  void setSelectedCampus(If v) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setSelectedCampus');
    try {
      return super.setSelectedCampus(v);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDegree(Degree v) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setSelectedDegree');
    try {
      return super.setSelectedDegree(v);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCourse(String v) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setSelectedCourse');
    try {
      return super.setSelectedCourse(v);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValidName: ${isValidName},
isValidEmail: ${isValidEmail},
isValidPassword: ${isValidPassword},
isValidBirthDate: ${isValidBirthDate},
selectedCampus: ${selectedCampus},
selectedDegree: ${selectedDegree},
selectedCourse: ${selectedCourse},
courses: ${courses}
    ''';
  }
}
