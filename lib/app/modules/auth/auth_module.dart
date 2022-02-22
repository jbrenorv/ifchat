import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/modules/auth/pages/signup/signup_controller.dart';

import 'pages/signin/signin_page.dart';
import 'pages/signup/signup_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignupController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SiginPage()),
    ChildRoute('/signup', child: (_, args) => const SigupPage()),
  ];
}
