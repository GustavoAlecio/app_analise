import 'package:app_analise/app/modules/screen_arguments/screen_arguments.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_analise/app//modules/grafico/grafico/grafico_store.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GraficoPage extends StatefulWidget {
  final String title;
  const GraficoPage({Key? key, this.title = 'GraficoPage'}) : super(key: key);
  @override
  GraficoPageState createState() => GraficoPageState();
}

class GraficoPageState extends State<GraficoPage> {
  final GraficoStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    getSeriesdata() {
      List<charts.Series<CurvaPV, double>> series = [
        charts.Series(
            id: "Linha Superior",
            data: args.resultadoSuperior,
            domainFn: (CurvaPV series, _) => series.lineX,
            measureFn: (CurvaPV series, _) => series.result,
            colorFn: (CurvaPV series, _) =>
                charts.MaterialPalette.blue.shadeDefault),
        charts.Series(
            id: "Linha Inferior",
            data: args.resultadoInferior,
            domainFn: (CurvaPV series, _) => series.lineX,
            measureFn: (CurvaPV series, _) => series.result,
            colorFn: (CurvaPV series, _) =>
                charts.MaterialPalette.red.shadeDefault,
            displayName: "Curva PV")
      ];
      return series;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Graficos"),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: 550,
        width: 400,
        child: Card(
          child: charts.LineChart(
            getSeriesdata(),
            animate: true,
          ),
        ),
      )),
    );
  }
}
