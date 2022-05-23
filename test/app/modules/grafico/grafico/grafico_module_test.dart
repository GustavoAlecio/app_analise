import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_analise/app//modules/grafico/grafico/grafico_module.dart';

void main() {
  setUpAll(() {
    initModule(GraficoModule());
  });
}
