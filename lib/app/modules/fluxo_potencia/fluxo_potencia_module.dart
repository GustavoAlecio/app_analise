import 'package:app_analise/app/modules/fluxo_potencia/fluxo_potencia_page.dart';
import 'package:app_analise/app/modules/fluxo_potencia/fluxo_potencia_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FluxoPotenciaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FluxoPotenciaStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const FluxoPotenciaPage()),
  ];
}
