import 'package:app_analise/app/modules/screen_arguments/screen_arguments.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int radioValue = 0;

  @action
  setRadioValue(int value) => radioValue = value;

  @observable
  double tensaoEntrada = 0.0;

  @action
  setTensaoEntrada(double value) => tensaoEntrada = value;

  @observable
  double fatorPotencia = 0.0;

  @action
  setFatorPotencia(double value) => fatorPotencia = value;

  @observable
  double resistencia = 0.0;

  @action
  setResistencia(double value) => resistencia = value;

  @observable
  double reatancia = 0.0;

  @action
  setReatancia(double value) => reatancia = value;

  @observable
  double potenciaInicial = 0.0;

  @action
  setPotenciaInicial(double value) => potenciaInicial = value;

  @observable
  double potenciaFinal = 0.0;

  @observable
  double potenciaInstantanea = 0.0;

  @observable
  List potenciaAtivaList = [];

  @observable
  List potenciaReativaList = [];

  @action
  setPotenciaFinal(double value) => potenciaFinal = value;

  @observable
  int numeroIteracoes = 0;

  @observable
  double variavel = 0.00005;

  @observable
  List<String> iteracoes = [];

  @observable
  List<String> potenciaIteracao = [];

  @observable
  double baskharaB = 0.0;

  @observable
  double baskharaC = 0.0;

  @observable
  List<double> resultadoY1 = [];

  @observable
  List<double> resultadoY2 = [];

  @observable
  List pontoCritico = [0, 0];

  @observable
  List<CurvaPV> data1 = [];

  @observable
  List<CurvaPV> data2 = [];

  @action
  setResultadoY1(double value) {
    resultadoY1.add(value);
  }

  @action
  setResultadoY2(double value) {
    resultadoY2.add(value);
  }

  @observable
  double potenciaAtiva = 0.0;

  @observable
  double potenciaReativa = 0.0;

  @observable
  bool loading = false;

  @action
  setPotenciaAtiva() {
    if (fatorPotencia != 0.0 &&
        potenciaInicial >= 0.0 &&
        potenciaFinal != 0.0) {
      List resultado = [];
      iteracoes.clear();
      potenciaInstantanea = 0;
      while (potenciaInstantanea <= potenciaFinal) {
        double calculo = (potenciaInstantanea).toPrecision(4);
        resultado.add(calculo);
        potenciaIteracao.add(potenciaInstantanea.toPrecision(2).toString());
        potenciaInstantanea += variavel;
      }
      return resultado;
    }
  }

  @action
  setPotenciaReativa() {
    if (fatorPotencia != 0.0 &&
        potenciaInicial >= 0.0 &&
        potenciaFinal != 0.0) {
      List resultado = [];
      potenciaInstantanea = 0.0;
      while (potenciaInstantanea <= potenciaFinal) {
        double calculo =
            ((potenciaInstantanea / fatorPotencia) * sin(acos(fatorPotencia)))
                .toPrecision(4);
        resultado.add(calculo);
        potenciaInstantanea += variavel;
      }

      return resultado;
    }
  }

  @action
  setB(int i) {
    // double x1 = ((resistencia * potenciaAtivaList[i]) +
    //     (reatancia * potenciaReativaList[i]));
    // baskharaB = (2 * x1) - (tensaoEntrada * tensaoEntrada);
    double x1 = resistencia * potenciaAtivaList[i];
    double x2 = reatancia * potenciaReativaList[i];
    double x3 = tensaoEntrada * tensaoEntrada;
    baskharaB = (2 * (x1 + x2) - (x3)).toPrecision(4);
  }

  @action
  setC(int i) {
    double x1 = ((resistencia * potenciaReativaList[i]) -
        (reatancia * potenciaAtivaList[i]));
    double x2 = ((resistencia * potenciaAtivaList[i]) +
        (reatancia * potenciaReativaList[i]));
    baskharaC = (x1 * x1) + (x2 * x2);
    baskharaC = baskharaC.toPrecision(4);
  }

  @action
  setCalculos() async {
    resultadoY1.clear();
    resultadoY2.clear();
    potenciaAtivaList.clear();
    potenciaReativaList.clear();
    potenciaAtivaList = await setPotenciaAtiva();
    potenciaReativaList = await setPotenciaReativa();

    potenciaInstantanea = 0.0;
    int i = 0;
    do {
      setB(i);
      setC(i);
      double delta = ((baskharaB * baskharaB) - (4 * baskharaC)).toPrecision(4);

      if (delta > 0) {
        double y1 = ((-baskharaB + sqrt(delta)) / 2).toPrecision(4);

        double y2 = ((-baskharaB - sqrt(delta)) / 2).toPrecision(4);

        double resulty1 = sqrt(y1).toPrecision(4);

        double resulty2 = sqrt(y2).toPrecision(4);
        if (resulty1.isNaN) {
          break;
        }
        setResultadoY1(resulty1);
        setResultadoY2(resulty2);
        pontoCritico[0] = resultadoY1[i].toPrecision(4);
        pontoCritico[1] = potenciaInstantanea.toPrecision(3);
        i++;
        potenciaInstantanea += variavel;
      } else {
        break;
      }
    } while (potenciaInstantanea <= potenciaFinal);
    loading = true;
    await setCurvaPV();
    loading = false;
  }

  @action
  setCurvaPV() {
    data1.clear();
    data2.clear();
    int iterador = 0;

    for (double i = 0.0; i < potenciaInstantanea; i += variavel) {
      data1.add(CurvaPV(i, resultadoY1[iterador]));
      data2.add(CurvaPV(i, resultadoY2[iterador]));
      iterador++;
    }
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
