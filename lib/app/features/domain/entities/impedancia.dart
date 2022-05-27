import 'package:app_analise/app/features/domain/entities/pu.dart';
import 'package:equatable/equatable.dart';

enum TipoImpedancia { resistiva, indutiva, capacitiva }

class Impedancia extends Equatable implements PU {
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

  final TipoImpedancia tipoImpedancia;

  const Impedancia({
    required this.isPolar,
    required this.tipoImpedancia,
    this.modulo,
    this.fasor,
    this.real,
    this.imaginario,
    this.fatorPotencia,
  });

  @override
  List<Object?> get props => [
        fasor,
        modulo,
        real,
        imaginario,
        isPolar,
        tipoImpedancia,
      ];
}
