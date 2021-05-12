import 'package:mobx/mobx.dart';

class ContadorController {
  ContadorController() {
    increment = Action(_increment);
  }

  final _valor = Observable(0);

  int get valor => _valor.value;
  set valor(value) => _valor.value = value;

  Action increment;
  Computed<String> _mensagemMultiplicacao;

  String get mensagemMultiplicacao {
    _mensagemMultiplicacao ??= Computed<String>(
        () => 'O valor multiplicado por 2  é ${_valor.value * 2}');
    return _mensagemMultiplicacao.value;
  }

  void _increment() {
    _valor.value++;
  }
}
