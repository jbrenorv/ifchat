import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:ifchat/app/shared/interfaces/i_storage_service.dart';
import 'package:ifchat/app/shared/utils/default_response.dart';

class StorageService extends IStorageService {
  final FirebaseStorage firebaseStorage;

  StorageService(this.firebaseStorage);

  @override
  Future<DefaultResponse<String>> saveUserPhoto(
    String uid,
    String photoName,
    File photo,
  ) async {
    final ref = firebaseStorage.ref('/users/$uid/photos/$photoName');

    try {
      await ref.putFile(photo);
      final url = await ref.getDownloadURL();
      return DefaultResponse(value: url);
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado');
    }
  }

  @override
  Future<DefaultResponse> deleteUserPhotos(String uid) async {
    final ref = firebaseStorage.ref('/users/$uid/photos/');

    try {
      await ref.delete();
      return DefaultResponse();
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado');
    }
  }
}
