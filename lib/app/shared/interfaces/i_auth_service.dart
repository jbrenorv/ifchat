import 'package:ifchat/app/shared/utils/default_response.dart';

abstract class IAuthService {
  bool hasUserLoggedIn();

  Future<DefaultResponse<String>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<DefaultResponse> deleteUserAccount();

  Future<DefaultResponse> logout();

  Future<DefaultResponse<String>> signInWithEmailAndPassword(
      String email, String password);

  String get uid;
}
