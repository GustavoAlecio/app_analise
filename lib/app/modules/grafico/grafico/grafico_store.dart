import 'package:mobx/mobx.dart';

part 'grafico_store.g.dart';

class GraficoStore = _GraficoStoreBase with _$GraficoStore;
abstract class _GraficoStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}