import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/shared/routes/app_routes.dart';
import 'package:ifchat/app/shared/services/auth_service.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: AppRoutes.signin);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) =>
      Modular.get<AuthService>().hasUserLoggedIn();
}
