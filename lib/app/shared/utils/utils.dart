import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }

    return File(pickedFile.path);
  }
}
