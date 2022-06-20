import 'package:app_analise/app/models.dart';

final listaBarras = [
  Barra(
    idBarra: 1,
    tipo: 'V',
    potenciaConsumida: 0,
    reatanciaGerada: 0,
    tensao: 1,
    angulo: 0,
  ),
  Barra(
    idBarra: 2,
    tipo: 'PQ',
    potenciaConsumida: 0.3,
    reatanciaGerada: 0.07,
    tensao: 0,
    angulo: 0,
  ),
];

final listaLinha = [
  Linha(
    conexao: '1-2',
    r: 0.2,
    x: 1,
    shant: 0.02,
  )
];


