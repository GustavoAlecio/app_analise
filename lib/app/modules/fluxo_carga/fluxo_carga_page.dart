import 'dart:ui';

import 'package:app_analise/app/modules/fluxo_carga/fluxo_carga_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FluxoCarga extends StatefulWidget {
  const FluxoCarga({Key? key}) : super(key: key);

  @override
  State<FluxoCarga> createState() => _FluxoCargaState();
}

class _FluxoCargaState extends State<FluxoCarga> {
  final FluxoCargaStore store = Modular.get<FluxoCargaStore>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SafeArea(
        child: Scaffold(
          floatingActionButton: constraints.maxWidth > 500
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomFloatingButtom1(
                      store: store,
                      constraints: constraints,
                    ),
                    CustomFloatingButtom2(
                      store: store,
                      constraints: constraints,
                    ),
                    CustomFloatingButtom3(
                      store: store,
                      constraints: constraints,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomFloatingButtom1(
                      store: store,
                      constraints: constraints,
                    ),
                    CustomFloatingButtom2(
                      store: store,
                      constraints: constraints,
                    ),
                    CustomFloatingButtom3(
                      store: store,
                      constraints: constraints,
                    ),
                  ],
                ),
          body: Observer(
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Valores: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CustomListViewBarra(store: store),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CustomListViewLinha(
                    store: store,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Resultados: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    height: constraints.maxHeight * 0.6,
                    width: constraints.maxWidth,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                childAspectRatio: 4 / 7,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: store.resultadosList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return SizedBox(
                            width: 250,
                            child: Card(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'Iteração:',
                                    value:
                                        "${store.resultadosList[index].iteracao ?? ""}",
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'Matriz G: ',
                                    value: store.resultadosList[index].matrizG
                                        .toString(),
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'Matriz B: ',
                                    value: store.resultadosList[index].matrizB
                                        .toString(),
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'Potência Ativa\nEspecificada: ',
                                    value:
                                        '${store.resultadosList[index].potenciaAtivaEspecificada ?? ""}',
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'Potência Reativa\nEspecificada: ',
                                    value:
                                        '${store.resultadosList[index].potenciaReativaEspecificada ?? ""}',
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'P2: ',
                                    value:
                                        '${store.resultadosList[index].resultP2 ?? ""}',
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'Q2: ',
                                    value:
                                        '${store.resultadosList[index].resultQ2 ?? ""}',
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'ΔP2: ',
                                    value:
                                        '${store.resultadosList[index].deltaP2 ?? ""}',
                                  ),
                                  CustomValueResult(
                                    store: store,
                                    index: index,
                                    title: 'ΔQ2: ',
                                    value:
                                        '${store.resultadosList[index].deltaQ2 ?? ""}',
                                  ),
                                ],
                              ),
                            )),
                          );
                        }),

                    // ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   shrinkWrap: true,
                    //   itemCount: store.resultadosList.length,
                    //   itemBuilder: (context, index) {
                    //     return SizedBox(
                    //       width: 250,
                    //       child: Card(
                    //           child: Padding(
                    //         padding:
                    //             const EdgeInsets.symmetric(horizontal: 10.0),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'Iteração:',
                    //               value:
                    //                   "${store.resultadosList[index].iteracao ?? ""}",
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'Matriz G: ',
                    //               value: store.resultadosList[index].matrizG
                    //                   .toString(),
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'Matriz B: ',
                    //               value: store.resultadosList[index].matrizB
                    //                   .toString(),
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'Potência Ativa\nEspecificada: ',
                    //               value:
                    //                   '${store.resultadosList[index].potenciaAtivaEspecificada ?? ""}',
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'Potência Reativa\nEspecificada: ',
                    //               value:
                    //                   '${store.resultadosList[index].potenciaReativaEspecificada ?? ""}',
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'P2: ',
                    //               value:
                    //                   '${store.resultadosList[index].resultP2 ?? ""}',
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'Q2: ',
                    //               value:
                    //                   '${store.resultadosList[index].resultQ2 ?? ""}',
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'ΔP2: ',
                    //               value:
                    //                   '${store.resultadosList[index].deltaP2 ?? ""}',
                    //             ),
                    //             CustomValueResult(
                    //               store: store,
                    //               index: index,
                    //               title: 'ΔQ2: ',
                    //               value:
                    //                   '${store.resultadosList[index].deltaQ2 ?? ""}',
                    //             ),
                    //           ],
                    //         ),
                    //       )),
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ],
            ),
          ),
          // Observer(
          //   builder: (context) => Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         height: constraints.maxHeight,
          //         width: constraints.maxWidth,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: store.barraLinha.isEmpty
          //               ? const Center(
          //                   child: Text('Adicione um item!'),
          //                 )
          //               : GridView.builder(
          //                   gridDelegate:
          //                       const SliverGridDelegateWithMaxCrossAxisExtent(
          //                           maxCrossAxisExtent: 150,
          //                           childAspectRatio: 4 / 5,
          //                           crossAxisSpacing: 10,
          //                           mainAxisSpacing: 10),
          //                   itemCount: store.barraLinha.length,
          //                   itemBuilder: (BuildContext ctx, index) {
          //                     return InkWell(
          //                       onTap: () {
          //                         showDialog(
          //                             context: context,
          //                             builder: (context) => CustomAlertDialogPage(
          //                                   store: store,
          //                                   constraints: constraints,
          //                                   index: index,
          //                                 ));
          //                       },
          //                       child: Card(
          //                         child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceEvenly,
          //                             mainAxisSize: MainAxisSize.min,
          //                             children: [
          //                               Padding(
          //                                 padding: const EdgeInsets.all(15.0),
          //                                 child: Text('${index + 1}'),
          //                               ),
          //                               const Padding(
          //                                 padding: EdgeInsets.symmetric(
          //                                     vertical: 10, horizontal: 10),
          //                                 child: Text(
          //                                   'Clique para + detalhes',
          //                                   textAlign: TextAlign.center,
          //                                 ),
          //                               ),
          //                             ]),
          //                       ),
          //                     );
          //                   }),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

class CustomValueResult extends StatelessWidget {
  const CustomValueResult({
    Key? key,
    required this.store,
    required this.index,
    required this.title,
    required this.value,
  }) : super(key: key);

  final FluxoCargaStore store;
  final int index;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 2,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontSize: 14,
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}

class CustomListViewBarra extends StatelessWidget {
  const CustomListViewBarra({
    Key? key,
    required this.store,
  }) : super(key: key);

  final FluxoCargaStore store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: store.listBarras.length,
        itemBuilder: (context, index) => SizedBox(
          width: 130,
          child: Card(
              child: store.listBarras[index].tipo == "PQ"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Barra ${store.listBarras[index].idBarra ?? ""}:'),
                          Text('Tipo: ${store.listBarras[index].tipo ?? ""}'),
                          Row(
                            children: [
                              const Text('P'),
                              const Text(
                                'c',
                                style: TextStyle(
                                  fontFeatures: [
                                    FontFeature.enable('subs'),
                                  ],
                                ),
                              ),
                              Text(
                                  ': ${store.listBarras[1].potenciaConsumida ?? ""}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Q'),
                              const Text(
                                'g',
                                style: TextStyle(
                                  fontFeatures: [
                                    FontFeature.enable('subs'),
                                  ],
                                ),
                              ),
                              Text(
                                  ': ${store.listBarras[index].reatanciaGerada ?? ""}'),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Barra ${store.listBarras[index].idBarra ?? ""}:'),
                          Text('Tipo: ${store.listBarras[index].tipo ?? ""}'),
                          Text(
                              'Tensão ${store.listBarras[index].tensao ?? ""} [pu]'),
                          Text(
                              'Angulo ${store.listBarras[index].angulo ?? ""} [º]'),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}

class CustomListViewLinha extends StatelessWidget {
  const CustomListViewLinha({
    Key? key,
    required this.store,
  }) : super(key: key);

  final FluxoCargaStore store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: store.listLinhas.length,
        itemBuilder: (context, index) => SizedBox(
          width: 130,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Linha ${store.listLinhas[index].conexao ?? ""}:'),
                Text('Resistência: ${store.listLinhas[index].r ?? ""}'),
                Text('Reatância: ${store.listLinhas[index].x ?? ""}'),
                Text('Shant: ${store.listLinhas[index].shant ?? ""}'),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class CustomListViewResultados extends StatelessWidget {
  const CustomListViewResultados({
    Key? key,
    required this.store,
  }) : super(key: key);

  final FluxoCargaStore store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: store.resultadosList.length,
        itemBuilder: (context, index) => SizedBox(
          width: 130,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Admitancia ${store.resultadosList[index].admitancia ?? ""}:'),
                Text('Matriz G: ${store.resultadosList[index].matrizG ?? ""}'),
                Text('Reatância: ${store.resultadosList[index].matrizB ?? ""}'),
                Text(
                    'Potência Ativa Especificada: ${store.resultadosList[index].potenciaAtivaEspecificada ?? ""}'),
                Text(
                    'Potência Reativa Especificada: ${store.resultadosList[index].potenciaReativaEspecificada ?? ""}'),
                Text('P2: ${store.resultadosList[index].resultP2 ?? ""}'),
                Text('Q2: ${store.resultadosList[index].resultQ2 ?? ""}'),
                Text('ΔP2: ${store.resultadosList[index].deltaP2 ?? ""}'),
                Text('ΔQ2: ${store.resultadosList[index].deltaQ2 ?? ""}'),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class CustomFloatingButtom3 extends StatelessWidget {
  const CustomFloatingButtom3(
      {Key? key, required this.store, required this.constraints})
      : super(key: key);

  final FluxoCargaStore store;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: FloatingActionButton.extended(
        onPressed: () {
          store.calculo();
        },
        label: constraints.maxWidth > 500
            ? const Text('Calcular Fluxo de Potencia')
            : const Text('Calcular'),
      ),
    );
  }
}

class CustomFloatingButtom2 extends StatelessWidget {
  const CustomFloatingButtom2({
    Key? key,
    required this.store,
    required this.constraints,
  }) : super(key: key);

  final FluxoCargaStore store;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: FloatingActionButton.extended(
        onPressed: () {
          // store.setGridCount(1);
          // store.addItemList();
          // showDialog(
          //     context: context,
          //     builder: (context) => CustomRegisterAlertDialogPage(
          //           store: store,
          //           constraints: constraints,
          //         ));
        },
        label: constraints.maxWidth > 500
            ? const Text('Adicionar novo item')
            : const Icon(Icons.add),
      ),
    );
  }
}

class CustomFloatingButtom1 extends StatelessWidget {
  const CustomFloatingButtom1({
    Key? key,
    required this.store,
    required this.constraints,
  }) : super(key: key);

  final FluxoCargaStore store;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {
            store.resetGridCount();
          },
          label: Text(constraints.maxWidth > 500
              ? 'Remover todos os itens'
              : 'Remover todos')),
    );
  }
}
