import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_analise/app/modules/fluxo_potencia/fluxo_potencia_store.dart';
import 'package:flutter/material.dart';

class FluxoPotenciaPage extends StatefulWidget {
  final String title;
  const FluxoPotenciaPage({Key? key, this.title = 'FluxoPotenciaPage'})
      : super(key: key);
  @override
  FluxoPotenciaPageState createState() => FluxoPotenciaPageState();
}

class FluxoPotenciaPageState extends State<FluxoPotenciaPage> {
  final FluxoPotenciaStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
