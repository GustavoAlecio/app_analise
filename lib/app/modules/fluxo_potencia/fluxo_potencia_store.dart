import 'package:mobx/mobx.dart';

part 'fluxo_potencia_store.g.dart';

class FluxoPotenciaStore = _FluxoPotenciaStoreBase with _$FluxoPotenciaStore;

abstract class _FluxoPotenciaStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
