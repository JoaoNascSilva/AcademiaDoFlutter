import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revenda_gas/app/repositories/todos_repository.dart';

class NewTaskController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final ToDosRepository repository;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  TextEditingController nomeTaskController = TextEditingController();

  DateTime daySelected;
  bool saved = false;
  bool loading = false;
  String error;

  String get dayFormated => dateFormat.format(daySelected);

  NewTaskController({this.repository, String day}) {
    daySelected = dateFormat.parse(day);
  }

  Future<void> saveNewTask() async {
    try {
      if (formKey.currentState.validate()) {
        loading = true;
        saved = false;
        await repository.saveToDo(daySelected, nomeTaskController.text);
        saved = true;
        loading = false;
      }
    } catch (e) {
      print(e);
      error = 'Erro ao salvar Tarefa.';
    }
    notifyListeners();
  }
}
