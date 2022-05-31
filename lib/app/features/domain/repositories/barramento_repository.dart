import 'package:app_analise/app/features/domain/entities/pu.dart';

abstract class BarramentoRepository {
  Future transformaPolarParaRetangular(PU pu);
  Future transformaRetangularParaPolar(PU pu);
  void calculaAdmitancia(PU pu);
}
