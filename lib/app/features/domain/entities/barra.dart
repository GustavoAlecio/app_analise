import 'package:app_analise/app/features/domain/entities/pu.dart';
import 'package:equatable/equatable.dart';

class Barra extends Equatable implements PU {
  @override
  final double? modulo;

  @override
  final double? angulo;
  @override
  final double? real;
  @override
  final double? imaginario;
  @override
  final bool? isPolar;

  // final double? tensao;
  // final double? theta;
  final double? potenciaAtiva;
  final double? potenciaReativa;

  const Barra({
    // this.tensao,
    // this.theta,
    this.potenciaAtiva,
    this.potenciaReativa,
    this.modulo,
    this.angulo,
    this.real,
    this.imaginario,
    this.isPolar,
  });

  @override
  List<Object?> get props => [
        // tensao,
        // theta,
        potenciaAtiva,
        potenciaReativa,
        modulo,
        angulo,
        imaginario,
        isPolar,
      ];
}
