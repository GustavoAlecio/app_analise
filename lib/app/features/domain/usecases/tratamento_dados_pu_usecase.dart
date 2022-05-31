import 'package:app_analise/app/features/domain/entities/pu.dart';
import 'package:app_analise/app/features/domain/repositories/barramento_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'tratamento_dados_pu_usecase.g.dart';

abstract class TratamentoDadosPUusecase {
  Future call(PU pu);
}

@Injectable(singleton: false)
class TratamentoDadosPUImpl implements TratamentoDadosPUusecase {
  final BarramentoRepository repository;

  TratamentoDadosPUImpl(this.repository);

  @override
  Future call(PU pu) async {
    if (pu.isPolar!) {
      return repository.transformaPolarParaRetangular(pu);
    } else {
      return await repository.transformaRetangularParaPolar(pu);
    }
  }
}
