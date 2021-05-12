import 'package:app/contador2_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Contador2Controller();

  @override
  void initState() {
    super.initState();
    // autorun((_) {
    //   //! Executa uma vez no inicio, e quando ocorrer alteração no controller.valor
    //   print(('AutoRun executando...'));
    //   print(controller.valor);
    // });

    //! Somente executa o controller.valor
    //reaction((_) => controller.valor, (valor) => print(valor));

    //! Ação que executa somente uma única vez no contexto
    //! O mesmo para WhenAsync
    //when((_) => controller.valor == 2, () => print('Valor é = a 2'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              return Text(controller.mensagemMultiplicacao);
            }),
            Observer(builder: (_) {
              return Text(
                '${controller.valor}',
                style: Theme.of(context).textTheme.headline4,
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
