import 'package:equatable/equatable.dart';

class PU extends Equatable {
  final double? modulo;
  final double? angulo;
  final double? real;
  final double? imaginario;
  final bool? isPolar;

  const PU(
      {this.modulo, this.angulo, this.real, this.imaginario, this.isPolar});

  @override
  List<Object?> get props => [
        modulo,
        angulo,
        real,
        imaginario,
        isPolar,
      ];
}
