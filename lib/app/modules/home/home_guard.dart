import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/app_routes.dart';
import 'package:ifchat/app/shared/interfaces/i_auth_service.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: AppRoutes.signin);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) =>
      Modular.get<IAuthService>().hasUserLoggedIn();
}
