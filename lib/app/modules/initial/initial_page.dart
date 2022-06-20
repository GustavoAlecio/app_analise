import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_analise/app//modules/initial/initial_store.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  final String title;
  const InitialPage({Key? key, this.title = 'InitialPage'}) : super(key: key);
  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  final InitialStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode;
    Future.delayed(const Duration(seconds: 4)).then((_) {
      Modular.to.pushReplacementNamed("/fluxocarga");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo_ufmt.jpeg"),
            const Text(
              "Análise de Sistemas de Energia Elétrica 1",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
