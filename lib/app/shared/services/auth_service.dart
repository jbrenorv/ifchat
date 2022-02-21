import 'package:firebase_auth/firebase_auth.dart';

import '../interfaces/i_auth_service.dart';

class AuthService extends IAuthService {
  final FirebaseAuth firebaseAuth;

  AuthService(this.firebaseAuth);

  @override
  bool hasUserLoggedIn() {
    return firebaseAuth.currentUser != null;
  }
}
