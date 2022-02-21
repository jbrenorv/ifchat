import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/modules/home/home_guard.dart';
import 'package:ifchat/app/shared/services/auth_service.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'app_routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<FirebaseAuth>((i) => FirebaseAuth.instance),
    Bind<AuthService>((i) => AuthService(i.get<FirebaseAuth>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(AppRoutes.home, module: HomeModule(), guards: [HomeGuard()]),
    ModuleRoute(AppRoutes.signin, module: AuthModule())
  ];
}
