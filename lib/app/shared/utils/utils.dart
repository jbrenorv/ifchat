import 'dart:io';

import 'package:ifchat/app/shared/models/picked_image_model.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<PickedImageModel?> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }

    return PickedImageModel(
      data: File(pickedFile.path),
      name: pickedFile.name,
    );
  }

  static num abs(num n) => n >= 0 ? n : n * -1;
}
