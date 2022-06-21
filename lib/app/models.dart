class Barra {
  final int? idBarra;
  final String? tipo;
  final double? potenciaConsumida;
  final double? reatanciaGerada;
  final double? tensao;
  final double? angulo;
  double? potenciaEspecificada;
  double? pReativaEspecificada;

  Barra({
    this.idBarra,
    this.tipo,
    this.potenciaConsumida,
    this.reatanciaGerada,
    this.tensao,
    this.angulo,
    this.potenciaEspecificada,
    this.pReativaEspecificada,
  });
}

class Linha {
  final String? conexao;
  final double? r;
  final double? x;
  final double? shant;

  Linha({
    this.conexao,
    this.r,
    this.x,
    this.shant,
  });
}

class Admitancia {
  final String? conexao;
  final double? resistencia;
  final double? reatancia;
  final MatrizAdmitancia2x2? matrizG;
  final MatrizAdmitancia2x2? matrizB;

  Admitancia({
    this.conexao,
    this.resistencia,
    this.reatancia,
    this.matrizG,
    this.matrizB,
  });
}

class MatrizAdmitancia2x2 {
  final double? arg1;
  final double? arg2;
  final double? arg3;
  final double? arg4;

  MatrizAdmitancia2x2({
    this.arg1,
    this.arg2,
    this.arg3,
    this.arg4,
  });

  @override
  String toString() {
    return "[$arg1  $arg2 \n$arg3   $arg4]";
  }
}

class Resultados {
  int? iteracao;
  Admitancia? admitancia;
  MatrizAdmitancia2x2? matrizG;
  MatrizAdmitancia2x2? matrizB;
  Barra? barraInicio;
  Barra? barraFim;
  double? resultP2;
  double? resultQ2;
  double? potenciaAtivaEspecificada;
  double? potenciaReativaEspecificada;
  double? deltaP2;
  double? deltaQ2;

  Resultados({
    this.iteracao,
    this.admitancia,
    this.matrizG,
    this.matrizB,
    this.barraInicio,
    this.barraFim,
    this.resultP2,
    this.resultQ2,
    this.potenciaAtivaEspecificada,
    this.potenciaReativaEspecificada,
    this.deltaP2,
    this.deltaQ2,
  });
}
