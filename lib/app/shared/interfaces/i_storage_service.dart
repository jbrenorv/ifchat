import 'dart:io';

import 'package:ifchat/app/shared/utils/default_response.dart';

abstract class IStorageService {
  Future<DefaultResponse<String>> saveUserPhoto(
      String uid, String photoName, File photo);

  Future<DefaultResponse> deleteUserPhotos(String uid);
}
