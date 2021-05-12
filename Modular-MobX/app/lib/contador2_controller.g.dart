// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contador2_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Contador2Controller on _Contador2ControllerBase, Store {
  Computed<String> _$mensagemMultiplicacaoComputed;

  @override
  String get mensagemMultiplicacao => (_$mensagemMultiplicacaoComputed ??=
          Computed<String>(() => super.mensagemMultiplicacao,
              name: '_Contador2ControllerBase.mensagemMultiplicacao'))
      .value;

  final _$valorAtom = Atom(name: '_Contador2ControllerBase.valor');

  @override
  int get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(int value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$_Contador2ControllerBaseActionController =
      ActionController(name: '_Contador2ControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_Contador2ControllerBaseActionController.startAction(
        name: '_Contador2ControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_Contador2ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valor: ${valor},
mensagemMultiplicacao: ${mensagemMultiplicacao}
    ''';
  }
}
