import 'package:ifchat/app/shared/models/user_model.dart';
import 'package:ifchat/app/shared/utils/default_response.dart';

abstract class IDatabaseService {
  Future<DefaultResponse> createUser(UserModel user);

  Future<DefaultResponse> deleteUser(String uid);
}
