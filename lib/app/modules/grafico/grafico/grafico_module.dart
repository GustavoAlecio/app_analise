import 'package:app_analise/app//modules/grafico/grafico/grafico_Page.dart';
import 'package:app_analise/app//modules/grafico/grafico/grafico_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GraficoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GraficoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const GraficoPage()),
  ];
}
