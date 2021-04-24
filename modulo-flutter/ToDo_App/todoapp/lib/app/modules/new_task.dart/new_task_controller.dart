import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:revenda_gas/app/repositories/todos_repository.dart';

class TaskController extends ChangeNotifier {
  final ToDosRepository repository;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime daySelected;

  TaskController({this.repository, String day}) {
    daySelected = dateFormat.parse(day);
  }

  void saveNewTask(String description, DateTime dateTime) async {
    await repository.saveToDo(dateTime, description);
  }
}
