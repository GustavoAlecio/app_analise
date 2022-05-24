import 'package:app_analise/app/modules/screen_arguments/screen_arguments.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_analise/app//modules/grafico/grafico/grafico_store.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoPage extends StatefulWidget {
  final String title;
  const GraficoPage({Key? key, this.title = 'GraficoPage'}) : super(key: key);
  @override
  GraficoPageState createState() => GraficoPageState();
}

class GraficoPageState extends State<GraficoPage> {
  final GraficoStore store = Modular.get();
  final TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grafico Curva PV"),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: 400,
        child: Card(
            child: SfCartesianChart(
          title: ChartTitle(text: "Curva PV"),
          tooltipBehavior: tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<CurvaPV, double>(
              animationDelay: 2000,
              animationDuration: 5000,
              name: "Operação Estável",
              dataSource: args.resultadoSuperior,
              xValueMapper: (CurvaPV serie, _) => serie.lineX,
              xAxisName: "P",
              yValueMapper: (CurvaPV serie, _) => serie.result,
              yAxisName: "V2",
              enableTooltip: true,
            ),
            LineSeries<CurvaPV, double>(
              animationDelay: 2000,
              animationDuration: 5000,
              name: "Operação Instável",
              dataSource: args.resultadoInferior,
              xValueMapper: (CurvaPV serie, _) => serie.lineX,
              xAxisName: "P",
              yValueMapper: (CurvaPV serie, _) => serie.result,
              yAxisName: "V2",
              enableTooltip: true,
            ),
          ],
          primaryXAxis: NumericAxis(
            title: AxisTitle(text: "P\u2082 [pu]"),
            maximum: 1.001,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            maximumLabelWidth: 100,
          ),
          primaryYAxis: NumericAxis(
              title: AxisTitle(text: "V\u2082 [pu]"),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              maximumLabels: 3),
        )),
      )),
    );
  }
}
