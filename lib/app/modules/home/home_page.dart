import 'package:app_analise/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final FocusScopeNode node = FocusScopeNode();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Análise de Sistemas de Energia Elétrica 1"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              height: constraints.maxWidth > 400 ? 250 : 150,
              width: constraints.maxWidth > 400 ? 250 : 150,
              child: InkWell(
                onTap: () {
                  Modular.to.pushNamed("/curvaPV/");
                },
                child: const Card(
                  child: Center(child: Text("Curva PV")),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxWidth > 400 ? 250 : 150,
              width: constraints.maxWidth > 400 ? 250 : 150,
              child: InkWell(
                onTap: () {
                  Modular.to.pushNamed("/fluxoPotencia/");
                },
                child: const Card(
                  child: Center(
                      child: Text(
                    "Cálculo do Fluxo de Potência",
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
