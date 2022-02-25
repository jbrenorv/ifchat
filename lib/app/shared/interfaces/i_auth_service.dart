import 'package:ifchat/app/shared/utils/default_response.dart';

abstract class IAuthService {
  bool hasUserLoggedIn();

  Future<DefaultResponse<String>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<DefaultResponse> deleteUserAccount();

  String get uid;
}
