import 'dart:math';

import 'package:app_analise/app/features/domain/entities/pu.dart';
import 'package:app_analise/app/features/domain/entities/potencia.dart';
import 'package:app_analise/app/features/domain/repositories/tratamento_variaveis_repository.dart';

class TratamentoVariaveisUsecase implements ITratamentoVariaveisRepository {
  @override
  Future<PU> polarToRetangular(PU pu) async {
    double real = pu.modulo! * cos(pu.fasor!);
    double imaginario = pu.modulo! * sin(pu.fasor!);
    PU result = PU(isPolar: false, real: real, imaginario: imaginario);
    return result;
  }

  @override
  Future<PU> retangularToPolar(PU pu) async {
    double modulo = sqrt((pow(pu.real!, 2) + pow(pu.imaginario!, 2)));
    double fasor = atan(pu.imaginario! / pu.real!);
    PU result = PU(isPolar: true, modulo: modulo, fasor: fasor);
    return result;
  }

  @override
  Future<PU> anguloToFatorPotencia(PU pu) async {
    double fp = cos(pu.fasor!);
    PU result = PU(isPolar: false, fatorPotencia: fp);
    return result;
  }

  @override
  Future<Potencia> potenciaAparenteToAtivaEReativa(Potencia potencia) async {
    double ativa = potencia.potenciaAparente! * potencia.fatorPotencia!;
    double reativa =
        potencia.potenciaAparente! * sin(acos(potencia.fatorPotencia!));
    Potencia result = Potencia(
        isPolar: false, potenciaAtiva: ativa, potenciaReativa: reativa);
    return result;
  }

  @override
  Future<Potencia> potenciaAtivaToAparenteEReativa(Potencia potencia) async {
    double aparente = potencia.potenciaAtiva! / potencia.fatorPotencia!;
    double reativa = (potencia.potenciaAtiva! / potencia.fatorPotencia!) *
        sin(acos(potencia.fatorPotencia!));
    Potencia result = Potencia(
        isPolar: false, potenciaAparente: aparente, potenciaReativa: reativa);
    return result;
  }

  @override
  Future<Potencia> potenciaReativaToAparenteEAtiva(Potencia potencia) async {
    double aparente =
        potencia.potenciaReativa! / sin(acos(potencia.fatorPotencia!));
    double ativa =
        (potencia.potenciaReativa! / sin(acos(potencia.fatorPotencia!))) *
            potencia.fatorPotencia!;
    Potencia result = Potencia(
        isPolar: false, potenciaAparente: aparente, potenciaAtiva: ativa);
    return result;
  }
}
