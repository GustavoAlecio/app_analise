import 'package:flutter_test/flutter_test.dart';
import 'package:app_analise/app//modules/grafico/grafico/grafico_store.dart';
 
void main() {
  late GraficoStore store;

  setUpAll(() {
    store = GraficoStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}