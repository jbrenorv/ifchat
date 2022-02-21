import 'package:flutter_modular/flutter_modular.dart';

import 'pages/signin/signin_page.dart';
import 'pages/signup/signup_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SiginPage()),
    ChildRoute('/signup', child: (_, args) => const SigupPage()),
  ];
}
