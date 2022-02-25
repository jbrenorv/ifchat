import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifchat/app/shared/interfaces/i_database_service.dart';
import 'package:ifchat/app/shared/utils/default_response.dart';
import 'package:ifchat/app/shared/models/user_model.dart';

class DatabaseService extends IDatabaseService {
  final FirebaseFirestore firebaseFirestore;

  DatabaseService(this.firebaseFirestore);

  @override
  Future<DefaultResponse> createUser(UserModel user) async {
    final users = firebaseFirestore.collection('users');

    try {
      await users.doc(user.id).set(user.toMap());

      return DefaultResponse();
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado.');
    }
  }

  @override
  Future<DefaultResponse> deleteUser(String uid) async {
    final users = firebaseFirestore.collection('users');

    try {
      await users.doc(uid).delete();

      return DefaultResponse();
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado.');
    }
  }
}
