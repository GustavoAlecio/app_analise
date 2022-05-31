import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'curva_pv_controller.g.dart';

class CurvaPVController = _CurvaPVControllerBase with _$CurvaPVController;

abstract class _CurvaPVControllerBase with Store {
  @observable
  TextEditingController tensaoReferenciaController = TextEditingController();

  @observable
  double tensaoReferencia = 0.0;

  @action
  setTensaoReferencia(TextEditingController controller) =>
      tensaoReferencia = double.parse(controller.text);

  @observable
  TextEditingController fatorPotenciaController = TextEditingController();

  @observable
  double fatorPotencia = 0.0;

  @action
  setFatorPotencia(TextEditingController controller) =>
      fatorPotencia = double.parse(controller.text);

  @observable
  TextEditingController anguloController = TextEditingController();

  @observable
  double angulo = 0.0;

  @action
  setAngulo(TextEditingController controller) =>
      angulo = double.parse(controller.text);

  @observable
  TextEditingController resistenciaController = TextEditingController();

  @observable
  double resistencia = 0.0;

  @action
  setResistencia(TextEditingController controller) =>
      resistencia = double.parse(controller.text);

  @observable
  TextEditingController reatanciaController = TextEditingController();

  @observable
  double reatancia = 0.0;

  @action
  setReatancia(TextEditingController controller) =>
      reatancia = double.parse(controller.text);

  @observable
  TextEditingController potenciaAtivaController = TextEditingController();

  @observable
  double potenciaAtiva = 0.0;

  @action
  setPotenciaAtiva(TextEditingController controller) =>
      potenciaAtiva = double.parse(controller.text);

  @action
  calculos() {
    if (tensaoReferencia > 0 &&
        resistencia > 0 &&
        reatancia > 0 &&
        potenciaAtiva > 0) {
      double inst = 0;
      // ignore: unused_local_variable
      double potenciaInst = 0.0;
      do {} while (inst == potenciaAtiva);
    }
  }
}

double verifyPotenciaAtiva(double potencia, delta) {
  if (potencia <= 0.0) {
    throw Exception("Potência menor que 0.");
  } else {
    return potencia;
  }
}

double verifyPotenciaReativa(double potencia, theta, delta) {
  double result = 0.0;
  if (potencia <= 0.0) {
    throw Exception("Potência menor que 0.");
  } else {
    result = (potencia / cos(theta)) * sin(theta);
    return result;
  }
}

class PotenciaParams {
  final double potencia;
  final double theta;

  PotenciaParams(this.potencia, this.theta);
}
