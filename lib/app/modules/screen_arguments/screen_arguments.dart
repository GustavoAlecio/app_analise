class ScreenArguments {
  final List<CurvaPV> resultadoSuperior;
  final List<CurvaPV> resultadoInferior;

  ScreenArguments(this.resultadoSuperior, this.resultadoInferior);
}

class CurvaPV {
  final double lineX;
  final double result;

  CurvaPV(this.lineX, this.result);
}
