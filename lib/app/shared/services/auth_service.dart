import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifchat/app/shared/utils/default_response.dart';

import '../interfaces/i_auth_service.dart';

class AuthService extends IAuthService {
  final FirebaseAuth firebaseAuth;

  AuthService(this.firebaseAuth);

  @override
  bool hasUserLoggedIn() {
    return firebaseAuth.currentUser != null;
  }

  @override
  Future<DefaultResponse<String>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return DefaultResponse(value: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      String message = 'Algo deu errado.';
      if (e.code == 'weak-password') {
        message = 'Erro: senha muito fraca';
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        message = 'Erro: já existe uma conta com este email.';
        // print('The account already exists for that email.');
      }
      return DefaultResponse.error(message: message);
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado.');
      // print(e);
    }
  }

  @override
  Future<DefaultResponse> deleteUserAccount() async {
    try {
      await firebaseAuth.currentUser!.delete();
      return DefaultResponse();
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado.');
    }
  }

  @override
  String get uid => firebaseAuth.currentUser!.uid;

  @override
  Future<DefaultResponse> logout() async {
    try {
      await firebaseAuth.signOut();
      return DefaultResponse();
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado.');
    }
  }

  @override
  Future<DefaultResponse<String>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return DefaultResponse(value: userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return DefaultResponse.error(message: 'Email ou senha incorretos.');
      }
      return DefaultResponse.error(message: 'Algo deu errado.');
    } catch (e) {
      return DefaultResponse.error(message: 'Algo deu errado.');
    }
  }
}
