import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_analise/app/modules/fluxo_potencia/fluxo_potencia_module.dart';

void main() {
  setUpAll(() {
    initModule(FluxoPotenciaModule());
  });
}
