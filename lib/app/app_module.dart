import 'package:app_analise/app/modules/curva_pv/curva_pv_module.dart';
import 'package:app_analise/app/modules/fluxo_potencia/fluxo_potencia_module.dart';
import 'package:app_analise/app/modules/grafico/grafico_module.dart';
import 'package:app_analise/app/modules/home/home_module.dart';
import 'package:app_analise/app/modules/initial/initial_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: InitialModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/curvaPV", module: CurvaPvModule()),
    ModuleRoute("/grafico", module: GraficoModule()),
    ModuleRoute("/fluxoPotencia", module: FluxoPotenciaModule())
  ];
}
