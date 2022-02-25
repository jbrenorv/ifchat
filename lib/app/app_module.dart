import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/modules/home/home_guard.dart';
import 'package:ifchat/app/shared/interfaces/i_auth_service.dart';
import 'package:ifchat/app/shared/interfaces/i_database_service.dart';
import 'package:ifchat/app/shared/interfaces/i_storage_service.dart';
import 'package:ifchat/app/shared/services/auth_service.dart';
import 'package:ifchat/app/shared/services/database_service.dart';
import 'package:ifchat/app/shared/services/storage_service.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'app_routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<FirebaseAuth>((i) => FirebaseAuth.instance),
    Bind<FirebaseFirestore>((i) => FirebaseFirestore.instance),
    Bind<FirebaseStorage>((i) => FirebaseStorage.instance),
    Bind<IAuthService>((i) => AuthService(i.get<FirebaseAuth>())),
    Bind<IDatabaseService>((i) => DatabaseService(i.get<FirebaseFirestore>())),
    Bind<IStorageService>((i) => StorageService(i.get<FirebaseStorage>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      AppRoutes.home,
      module: HomeModule(),
      guards: [HomeGuard()],
    ),
    ModuleRoute(AppRoutes.signin, module: AuthModule())
  ];
}
