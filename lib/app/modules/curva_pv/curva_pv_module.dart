import 'package:app_analise/app/modules/curva_pv/curva_pv_page.dart';
import 'package:app_analise/app/modules/curva_pv/curva_pv_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CurvaPvModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CurvaPvStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CurvaPvPage()),
  ];
}
