import 'package:app_analise/app//modules/initial/initial_Page.dart';
import 'package:app_analise/app//modules/initial/initial_store.dart';
import 'package:app_analise/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InitialStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const InitialPage()),
    ModuleRoute("/home", module: HomeModule())
  ];
}
