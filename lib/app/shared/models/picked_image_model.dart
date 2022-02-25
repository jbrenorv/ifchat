import 'dart:io';

class PickedImageModel {
  final File data;
  final String name;

  PickedImageModel({required this.data, required this.name});

  String get extendion => name.split('.').last;
}
