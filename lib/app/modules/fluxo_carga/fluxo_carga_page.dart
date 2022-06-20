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
          body: Column(
            children: const [Text('Resultados: ')],
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
          showDialog(
              context: context,
              builder: (context) => CustomRegisterAlertDialogPage(
                    store: store,
                    constraints: constraints,
                  ));
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

class CustomAlertDialogPage extends StatelessWidget {
  const CustomAlertDialogPage({
    Key? key,
    required this.store,
    required this.constraints,
    this.index,
  }) : super(key: key);

  final FluxoCargaStore store;
  final BoxConstraints constraints;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Barra ${store.listBarras[index!].idBarra! + 1}'),
        ],
      ),
      content: Observer(builder: (_) {
        return SizedBox(
          height: constraints.maxHeight * 0.4,
          width: constraints.maxWidth * 0.3,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRadio1(store: store),
                store.radio1 == 0
                    ? CustomFormBarra(constraints: constraints, store: store)
                    : CustomFormLinha(constraints: constraints, store: store),
              ]),
        );
      }),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            store.setGridCount(-1);
            Navigator.pop(context, 'Remover');
          },
          child: const Text(
            'Remover',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancelar'),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            store.setBarraLinha();
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class CustomRegisterAlertDialogPage extends StatelessWidget {
  const CustomRegisterAlertDialogPage({
    Key? key,
    required this.store,
    required this.constraints,
    this.index,
  }) : super(key: key);

  final FluxoCargaStore store;
  final BoxConstraints constraints;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Insira os dados do item'),
        ],
      ),
      content: SingleChildScrollView(
        child: Observer(builder: (_) {
          return SizedBox(
            height: constraints.maxHeight * 0.4,
            width: constraints.maxWidth * 0.3,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRadio1(store: store),
                  store.radio1 == 0
                      ? CustomFormBarra(constraints: constraints, store: store)
                      : CustomFormLinha(constraints: constraints, store: store),
                ]),
          );
        }),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            store.setGridCount(-1);
            Navigator.pop(context, 'Remover');
          },
          child: const Text(
            'Remover',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancelar'),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            store.setBarraLinha();
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class CustomFormLinha extends StatelessWidget {
  const CustomFormLinha({
    Key? key,
    required this.constraints,
    required this.store,
  }) : super(key: key);

  final BoxConstraints constraints;
  final FluxoCargaStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: constraints.maxWidth * 0.3,
          child: TextFormField(
            controller: store.resistencia,
            decoration: const InputDecoration(
                hintText: 'Qual é o valor da resistencia?'),
            onFieldSubmitted: (String value) => store.setResistencia(value),
          ),
        ),
        SizedBox(
          width: constraints.maxWidth * 0.3,
          child: TextFormField(
            controller: store.reatancia,
            decoration:
                const InputDecoration(hintText: 'Qual é o valor da reatancia?'),
            onFieldSubmitted: (String value) => store.setReatancia(value),
          ),
        ),
        SizedBox(
          width: constraints.maxWidth * 0.3,
          child: TextFormField(
            controller: store.shant,
            decoration:
                const InputDecoration(hintText: 'Qual é o valor de shant?'),
            onFieldSubmitted: (String value) => store.setShant(value),
          ),
        ),
      ],
    );
  }
}

class CustomFormBarra extends StatelessWidget {
  const CustomFormBarra({
    Key? key,
    required this.constraints,
    required this.store,
  }) : super(key: key);

  final BoxConstraints constraints;
  final FluxoCargaStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: constraints.maxWidth * 0.5,
            child: TextFormField(
              controller: store.barraUnidade,
              decoration: const InputDecoration(hintText: 'Barra de número:'),
              onChanged: (String value) => store.setBarraUnidade(value),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: store.radio2,
                    onChanged: (int? value) => store.setRadio2(value!),
                  ),
                  const Text('Barra VΘ'),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: store.radio2,
                    onChanged: (int? value) => store.setRadio2(value!),
                  ),
                  const Text('Barra PQ'),
                ],
              ),
            ],
          ),
          store.radio2 == 0
              ? Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: TextFormField(
                        controller: store.tensao,
                        decoration: const InputDecoration(
                            hintText: 'Qual é o valor de tensão?'),
                        onFieldSubmitted: (String value) =>
                            store.setTensao(value),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: TextFormField(
                        controller: store.theta,
                        decoration:
                            const InputDecoration(hintText: 'Qual é o ângulo?'),
                        onFieldSubmitted: (String value) =>
                            store.setTheta(value),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: TextFormField(
                        controller: store.pC,
                        decoration: const InputDecoration(
                            hintText: 'Qual é o valor de Potencia consumida?'),
                        onFieldSubmitted: (String value) {
                          store.setPC(value);
                        },
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: TextFormField(
                        controller: store.qG,
                        decoration: const InputDecoration(
                            hintText: 'Qual é o valor de Potencia gerada?'),
                        onFieldSubmitted: (String value) => store.setQG(value),
                      ),
                    ),
                  ],
                )
        ],
      );
    });
  }
}

class CustomRadio1 extends StatelessWidget {
  const CustomRadio1({
    Key? key,
    required this.store,
  }) : super(key: key);

  final FluxoCargaStore store;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: store.radio1,
              onChanged: (int? value) => store.setRadio1(value!),
            ),
            const Text('Barra'),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: store.radio1,
              onChanged: (int? value) => store.setRadio1(value!),
            ),
            const Text('Linha'),
          ],
        )
      ],
    );
  }
}
