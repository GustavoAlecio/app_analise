import 'package:app_analise/app/modules/fluxo_carga/fluxo_carga_page.dart';
import 'package:app_analise/app/modules/fluxo_carga/fluxo_carga_store.dart';
import 'package:app_analise/app/modules/grafico/grafico/grafico_store.dart';
import 'package:app_analise/app/modules/home/home_page.dart';
import 'package:app_analise/app/modules/home/home_store.dart';
import 'package:app_analise/app/modules/initial/initial_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/grafico/grafico/grafico_Page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => GraficoStore()),
    Bind.lazySingleton((i) => FluxoCargaStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: InitialModule()),
    ChildRoute('/curvaPV', child: (_, args) => const HomePage()),
    ChildRoute('/curvaPV/graphic', child: (_, args) => const GraficoPage()),
    ChildRoute('/fluxocarga', child: (_, args) => const FluxoCarga()),
  ];
}
