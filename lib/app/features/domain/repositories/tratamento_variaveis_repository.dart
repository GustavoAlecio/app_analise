import 'package:app_analise/app/features/domain/entities/potencia.dart';
import 'package:app_analise/app/features/domain/entities/pu.dart';

abstract class ITratamentoVariaveisRepository {
  Future<PU> polarToRetangular(PU pu);
  Future<PU> retangularToPolar(PU pu);
  Future<PU> anguloToFatorPotencia(PU pu);
  Future<Potencia>  potenciaAparenteToAtivaEReativa(Potencia potencia);
  Future<Potencia>  potenciaAtivaToAparenteEReativa(Potencia potencia);
  Future<Potencia>  potenciaReativaToAparenteEAtiva(Potencia potencia);
}
