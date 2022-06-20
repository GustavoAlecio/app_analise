import 'dart:math';

import 'package:app_analise/app/models.dart';
import 'package:app_analise/app/modules/fluxo_carga/dados.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'fluxo_carga_store.g.dart';

class FluxoCargaStore = _FluxoCargaStoreBase with _$FluxoCargaStore;

abstract class _FluxoCargaStoreBase with Store {
  @observable
  int gridCount = 0;
  @action
  setGridCount(int value) => gridCount += value;
  @action
  resetGridCount() => gridCount = 0;

  @observable
  TextEditingController barraUnidade = TextEditingController();
  @action
  setBarraUnidade(String value) => barraUnidade.text = value;

  @observable
  TextEditingController pC = TextEditingController();
  @action
  setPC(String value) => pC.text = value;

  @observable
  TextEditingController qG = TextEditingController();
  @action
  setQG(String value) => qG.text = value;

  @observable
  TextEditingController tensao = TextEditingController();
  @action
  setTensao(String value) => tensao.text = value;

  @observable
  TextEditingController theta = TextEditingController();
  @action
  setTheta(String value) => theta.text = value;

  @observable
  TextEditingController resistencia = TextEditingController();
  @action
  setResistencia(String value) => resistencia.text = value;

  @observable
  TextEditingController reatancia = TextEditingController();
  @action
  setReatancia(String value) => reatancia.text = value;

  @observable
  TextEditingController shant = TextEditingController();
  @action
  setShant(String value) => shant.text = value;

  @observable
  double tolerancia = 0.0;

  @observable
  int radio1 = 0;
  @action
  setRadio1(int value) => radio1 = value;

  @observable
  int radio2 = 0;
  @action
  setRadio2(int value) => radio2 = value;

  @observable
  List<Barra> listBarras = listaBarras;

  @observable
  List<Linha> listLinhas = listaLinha;

  @action
  addItemList() {
    listBarras.add(Barra());
  }

  @action
  setBarraLinha() {
    listBarras.add(Barra(
      idBarra: barraUnidade.text.isNotEmpty ? int.parse(barraUnidade.text) : 0,
      tipo: radio2 == 0 ? 'VΘ' : 'PQ',
      potenciaConsumida: pC.text.isNotEmpty ? double.parse(pC.text) : 0.0,
      reatanciaGerada: qG.text.isNotEmpty ? double.parse(qG.text) : 0.0,
      tensao: tensao.text.isNotEmpty ? double.parse(tensao.text) : 0.0,
      angulo: theta.text.isNotEmpty ? double.parse(theta.text) : 0.0,
    ));
    // barraLinha = barraLinha.toList();
    // print(barraLinha.length);
  }

  @observable
  List<Admitancia> admitancia = [];
  @observable
  double potenciaEspecificada = 0.0;
  @observable
  double potenciaReativaEspecificada = 0.0;
  @observable
  double resultP2 = 0.0;
  @observable
  double resultQ2 = 0.0;
  @observable
  double tensao2 = 1;
  @observable
  double angulo2 = 0;
  @observable
  double deltaP2 = 0.0;
  @observable
  double deltaQ2 = 0.0;
  @observable
  MatrizAdmitancia2x2? matrizG;
  @observable
  MatrizAdmitancia2x2? matrizB;
  @observable
  int iteracao = 0;

  @action
  calculo() {
    do {
      if (iteracao != 0) {
        double h = setHkk(resultQ2, tensao2, matrizB!.arg4!);
        double n = setNkk(resultP2, tensao2, matrizG!.arg4!);
        double m = setMkk(resultP2, tensao2, matrizG!.arg4!);
        double l = setLkk(resultQ2, tensao2, matrizB!.arg4!);
        MatrizAdmitancia2x2 matrix = MatrizAdmitancia2x2(
          arg1: h,
          arg2: n,
          arg3: m,
          arg4: l,
        );
        MatrizAdmitancia2x2 inverseMatrix = setInverseMatrix(matrix);

        double deltaTheta =
            inverseMatrix.arg1! * deltaP2 + (inverseMatrix.arg2! * deltaQ2);
        double deltaV2 =
            inverseMatrix.arg3! * deltaP2 + (inverseMatrix.arg4! * deltaQ2);
        angulo2 = angulo2 + deltaTheta;
        tensao2 = tensao2 + deltaV2;
      }
      for (var i = 0; i < listLinhas.length; i++) {
        Linha lista = listLinhas[i];
        Barra barraInicio;
        Barra barraFim;

        Admitancia admitanciaItem =
            setAdmitancia(lista.conexao!, lista.r!, lista.x!);
        matrizG = setMatrizG(admitanciaItem.resistencia!);
        matrizB = setMatrizB(admitanciaItem.reatancia!, lista.shant!);
        List<String> conex = lista.conexao!.split('-');
        barraInicio = listBarras
            .firstWhere((element) => element.idBarra.toString() == conex[0]);
        barraFim = listBarras
            .firstWhere((element) => element.idBarra.toString() == conex[1]);
        resultP2 = setP2(
          tensao1: barraInicio.tensao!,
          g: matrizG!,
          b: matrizB!,
          theta1: barraInicio.angulo!,
          tensao2: barraFim.tensao!,
          theta2: barraFim.angulo!,
        );
        resultQ2 = setQ2(
          tensao1: barraInicio.tensao!,
          g: matrizG!,
          b: matrizB!,
          theta1: barraInicio.angulo!,
          tensao2: barraFim.tensao!,
          theta2: barraFim.angulo!,
        );
        potenciaEspecificada =
            setPotenciaEspecificada(barraFim.potenciaConsumida!);
        potenciaReativaEspecificada =
            setPotenciaReativaEspecificada(barraFim.pReativaEspecificada!);
        deltaP2 = potenciaEspecificada - resultP2;
        deltaQ2 = potenciaReativaEspecificada - resultQ2;
      }
      iteracao++;
    } while (deltaP2 > tolerancia && deltaQ2 > tolerancia);
  }

  @action
  List setRectToPolar(double real, double imaginario) {
    double raio = sqrt(pow(real, 2) + pow(imaginario, 2));
    double theta = (atan(imaginario / real) * (180 / pi));
    List result = [raio, theta];
    return result;
  }

  @action
  List setPolarToRect(double raio, double theta) {
    double real = raio * cos(0.01745 * theta);
    double imaginario = raio * sin(0.01745 * theta);
    List result = [real, imaginario];
    return result;
  }

  @action
  Admitancia setAdmitancia(
      String conexao, double resistencia, double reatancia) {
    double raio = setRectToPolar(resistencia, reatancia)[0];
    double theta = setRectToPolar(resistencia, reatancia)[1];
    double admitancia = 1 / raio;
    theta = theta * (-1);

    Admitancia result = Admitancia(
      conexao: conexao,
      resistencia: setPolarToRect(admitancia, theta)[0],
      reatancia: setPolarToRect(admitancia, theta)[1],
    );
    return result;
  }

  @action
  setMatrizG(double resistencia) {
    MatrizAdmitancia2x2 result = MatrizAdmitancia2x2(
      arg1: resistencia,
      arg2: resistencia * (-1),
      arg3: resistencia * (-1),
      arg4: resistencia,
    );
    return result;
  }

  @action
  setMatrizB(double reatancia, double shant) {
    MatrizAdmitancia2x2 result = MatrizAdmitancia2x2(
        arg1: reatancia + shant,
        arg2: reatancia * (-1),
        arg3: reatancia * (-1),
        arg4: reatancia + shant);
    return result;
  }

  @action
  setInverseMatrix(MatrizAdmitancia2x2 matrix) {
    double determinante =
        (matrix.arg1! * matrix.arg4!) - ((matrix.arg2! * matrix.arg3!));
    MatrizAdmitancia2x2 result = MatrizAdmitancia2x2(
      arg1: (matrix.arg4! / determinante),
      arg2: (matrix.arg2! / determinante) * (-1),
      arg3: (matrix.arg3! / determinante) * (-1),
      arg4: (matrix.arg1! / determinante),
    );
    return result;
  }

  @action
  setHkk(double q, double v, double b) {
    double result = (-1) * q - pow(v, 2) * b;
    return result;
  }

  @action
  setNkk(double p, double v, double g) {
    double result = (p + (pow(v, 2) * g)) / v;
    return result;
  }

  @action
  setMkk(double p, double v, double g) {
    double result = p - pow(v, 2) * g;
    return result;
  }

  @action
  setLkk(double q, double v, double b) {
    double result = (q - (pow(v, 2) * b)) / v;
    return result;
  }

  @action
  setPotenciaEspecificada(double potenciaConsumida) {
    double result = 0 - potenciaConsumida;
    return result;
  }

  @action
  setPotenciaReativaEspecificada(double potenciaGerada) {
    double result = potenciaGerada - 0;
    return result;
  }

  @action
  setP2({
    required double tensao1,
    required MatrizAdmitancia2x2 g,
    required MatrizAdmitancia2x2 b,
    required double theta1,
    required double tensao2,
    required double theta2,
  }) {
    double result = ((tensao2 * tensao2) * g.arg4!) +
        ((tensao2 * tensao1) *
            (g.arg3! * cos(theta2 - theta1) + b.arg3! * sin(theta2 - theta1)));
    return result.toPrecision(4);
  }

  @action
  setQ2({
    required double tensao1,
    required MatrizAdmitancia2x2 g,
    required MatrizAdmitancia2x2 b,
    required double theta1,
    required double tensao2,
    required double theta2,
  }) {
    double result = -((tensao2 * tensao2) * b.arg4!) +
        (tensao2 * tensao1) *
            (g.arg3! * sin(theta2 - theta1) - b.arg3! * sin(theta2 - theta1));
    return result.toPrecision(4);
  }

  @action
  setValoresDeDelta(double q2, double v2, double b) {
    double h = (q2 * (-1)) - (pow(v2, 2)) * b;
    return h;
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
