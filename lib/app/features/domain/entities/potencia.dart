import 'package:app_analise/app/features/domain/entities/pu.dart';
import 'package:equatable/equatable.dart';

class Potencia extends Equatable implements PU {
  @override
  final double? modulo;
  @override
  final double? fasor;
  @override
  final double? real;
  @override
  final double? imaginario;
  @override
  final bool isPolar;

  @override
  final double? fatorPotencia;

  final double? potenciaAparente;

  final double? potenciaAtiva;

  final double? potenciaReativa;

  const Potencia({
    required this.isPolar,
    this.modulo,
    this.fasor,
    this.real,
    this.imaginario,
    this.potenciaAparente,
    this.potenciaAtiva,
    this.potenciaReativa,
    this.fatorPotencia,
  });

  @override
  List<Object?> get props => [
        fasor,
        modulo,
        real,
        imaginario,
        isPolar,
        potenciaAparente,
        potenciaAtiva,
        potenciaReativa,
      ];
}
