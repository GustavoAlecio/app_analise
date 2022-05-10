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
            id: "Curva PV",
            data: args.resultado,
            domainFn: (CurvaPV series, _) => series.lineX,
            measureFn: (CurvaPV series, _) => series.result,
            colorFn: (CurvaPV series, _) =>
                charts.MaterialPalette.blue.shadeDefault)
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
        child: Card(
          child: Expanded(child: charts.LineChart(getSeriesdata())),
        ),
      )),
    );
  }
}
