import 'package:flutter_test/flutter_test.dart';
import 'package:app_analise/app/modules/fluxo_potencia/fluxo_potencia_store.dart';

void main() {
  late FluxoPotenciaStore store;

  setUpAll(() {
    store = FluxoPotenciaStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
