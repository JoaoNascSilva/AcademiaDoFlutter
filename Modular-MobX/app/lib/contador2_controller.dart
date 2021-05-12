import 'package:mobx/mobx.dart';

part 'contador2_controller.g.dart';

class Contador2Controller = _Contador2ControllerBase with _$Contador2Controller;

abstract class _Contador2ControllerBase with Store {
  @observable
  int valor = 0;

  @action
  void increment() {
    valor++;
  }

  @computed
  String get mensagemMultiplicacao => 'O valor X por 2 é ${valor * 2}';
}
