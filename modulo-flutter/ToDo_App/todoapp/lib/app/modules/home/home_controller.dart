import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revenda_gas/app/models/todo_model.dart';
import 'package:revenda_gas/app/modules/login/login_page.dart';
import 'package:revenda_gas/app/repositories/todos_repository.dart';
import 'package:collection/collection.dart';

class HomeController extends ChangeNotifier {
  final ToDosRepository repository;
  int selectedTab = 1;
  DateTime daySelected;
  DateTime startFilter;
  DateTime endFilter;
  Map<String, List<ToDoModel>> listTodos;
  var dateFormat = DateFormat('dd/MM/yyyy');

  HomeController({this.repository}) {
    repository.saveToDo(DateTime.now(), 'Momento de Leitura');
    // repository.saveToDo(DateTime.now().add(Duration(hours: 24)), 'Dormir');
    findAllForWeek();
  }

  void changeSelectedTab(BuildContext context, index, ThemeData theme) async {
    selectedTab = index;
    switch (index) {
      case 0:
        this.filterFinalized();
        break;
      case 1:
        this.findAllForWeek();
        break;
      case 2:
        daySelected = await showDatePicker(
          builder: (context, child) {
            return Theme(
              data: theme,
              child: child,
            );
          },
          currentDate: DateTime.now(),
          context: context,
          initialDate: daySelected ?? DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: (365 * 3))),
          lastDate: DateTime.now().add(Duration(days: (365 * 10))),
        );
        findToDosBySelectedDay();
        break;
      case 3:
        Navigator.pushNamed(
          context,
          LogInPage.routerName,
        );
        break;
    }
    notifyListeners();
  }

  Future<void> findAllForWeek() async {
    daySelected = DateTime.now();

    startFilter = DateTime.now();
    if (startFilter.weekday != DateTime.monday) {
      startFilter =
          startFilter.subtract(Duration(days: startFilter.weekday - 1));
    }
    endFilter = startFilter.add(Duration(days: 6));

    var todos = await repository.findByPeriod(startFilter, endFilter);

    if (todos.isEmpty) {
      listTodos = {dateFormat.format(DateTime.now()): []};
    } else {
      listTodos =
          groupBy(todos, (ToDoModel todo) => dateFormat.format(todo.dateHour));
    }
    this.notifyListeners();
  }

  void checkOrUnCheck(ToDoModel todo) {
    todo.isfinished = !todo.isfinished;
    this.notifyListeners();
    repository.checkorUncheckToDo(todo);
  }

  void filterFinalized() {
    listTodos = listTodos.map((key, value) {
      var todosFinalized = value.where((t) => t.isfinished).toList();
      return MapEntry(key, todosFinalized);
    });
    this.notifyListeners();
  }

  Future<void> findToDosBySelectedDay() async {
    if (daySelected == null) return;
    var todos = await repository.findByPeriod(daySelected, daySelected);

    if (todos.isEmpty) {
      listTodos = {dateFormat.format(daySelected): []};
    } else {
      listTodos =
          groupBy(todos, (ToDoModel todo) => dateFormat.format(todo.dateHour));
    }
    this.notifyListeners();
  }

  void update() {
    if (selectedTab == 1) this.findAllForWeek();
    if (selectedTab == 2) this.findToDosBySelectedDay();
  }
}
