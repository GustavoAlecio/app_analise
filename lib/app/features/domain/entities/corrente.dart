import 'package:app_analise/app/features/domain/entities/pu.dart';
import 'package:equatable/equatable.dart';

class Corrente extends Equatable implements PU {
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

  const Corrente({
    required this.isPolar,
    this.modulo,
    this.fasor,
    this.real,
    this.imaginario,
    this.fatorPotencia,
  });

  @override
  List<Object?> get props => [
        modulo,
        fasor,
        real,
        imaginario,
        isPolar,
      ];
}
