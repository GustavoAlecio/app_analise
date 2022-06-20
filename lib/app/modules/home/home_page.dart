import 'package:app_analise/app/modules/home/home_store.dart';
import 'package:app_analise/app/modules/screen_arguments/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            title: Text(
              constraints.maxWidth < 500
                  ? "A.S.E.E. 1"
                  : 'Análise de Sistemas de Energia Elétrica',
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: FocusScope(
              node: node,
              child: Column(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: Text("Qual tensão deseja obter?"),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Observer(builder: (context) {
                  //           return Radio<int>(
                  //             groupValue: store.radioValue,
                  //             onChanged: (newValue) =>
                  //                 store.setRadioValue(newValue!),
                  //             value: 0,
                  //           );
                  //         }),
                  //         const Text("V1")
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Observer(builder: (_) {
                  //           return Radio<int>(
                  //             groupValue: store.radioValue,
                  //             onChanged: (newValue) =>
                  //                 store.setRadioValue(newValue!),
                  //             value: 1,
                  //           );
                  //         }),
                  //         const Text("V2")
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Observer(
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          child: SizedBox(
                            width: 150,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onEditingComplete: node.nextFocus,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onChanged: (value) => value.isNotEmpty
                                  ? store.setTensaoEntrada(double.parse(value))
                                  : null,
                              decoration: InputDecoration(
                                hintText: store.radioValue == 0
                                    ? "Tensão V2"
                                    : "Tensão V1",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onEditingComplete: node.nextFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => value.isNotEmpty
                                ? store.setFatorPotencia(double.parse(value))
                                : null,
                            decoration: const InputDecoration(
                              hintText: "Fator de Potência",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onEditingComplete: node.nextFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              value.isNotEmpty
                                  ? store.setResistencia(double.parse(value))
                                  : null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Resistência",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onEditingComplete: node.nextFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              value.isNotEmpty
                                  ? store.setReatancia(double.parse(value))
                                  : null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Reatância",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 10.0, horizontal: 10),
                      //   child: SizedBox(
                      //     width: 150,
                      //     child: TextFormField(
                      //       keyboardType: TextInputType.number,
                      //       onChanged: (value) {
                      //         if (value.isNotEmpty) {
                      //           store.setPotenciaInicial(double.parse(value));
                      //         }
                      //       },
                      //       decoration: const InputDecoration(
                      //         hintText: "Potência Inicial",
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onEditingComplete: node.nextFocus,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                store.setPotenciaFinal(double.parse(value));
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "Potência Ativa Final",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                      onPressed: () async {
                        node.unfocus();
                        await store.setCalculos();
                        setState(() {});
                      },
                      child: const Text("Calcular")),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: 50,
                      child: store.resultadoY1.length > 1
                          ? Text(
                              "Calculo completo, plotar gráfico! \n Ponto Critico: V2 =  ${store.pontoCritico[0]} e P2 = ${store.pontoCritico[1]}",
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          Modular.to.pushNamed("/curvaPV/grafico/",
                              arguments:
                                  ScreenArguments(store.data1, store.data2));
                        },
                        child: const Text("Plotar Gráfico")),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
