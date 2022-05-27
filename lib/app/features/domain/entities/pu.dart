import 'package:equatable/equatable.dart';

class PU extends Equatable {
  final double? modulo;
  final double? fasor;
  final double? real;
  final double? imaginario;
  final bool isPolar;
  final double? fatorPotencia;

  const PU({
    required this.isPolar,
    this.fatorPotencia,
    this.modulo,
    this.fasor,
    this.real,
    this.imaginario,
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
