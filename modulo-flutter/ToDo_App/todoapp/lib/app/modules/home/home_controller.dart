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
  int idUser;
  DateTime startFilter;
  DateTime endFilter;
  Map<String, List<ToDoModel>> listTodos;
  var dateFormat = DateFormat('dd/MM/yyyy');
  final formKey = GlobalKey<FormState>();

  HomeController({this.repository}) {
    findAllForWeek();
  }

  void changeSelectedTab(BuildContext context, index) async {
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
            // return Theme(
            //   data: ThemeData(
            //     colorScheme: ColorScheme(
            //       surface: Colors.pink,
            //       onSurface: Colors.grey[900],
            //       primary: AppColors.primaryColor,
            //       onPrimary: Colors.white,
            //       secondary: Colors.pink,
            //       onSecondary: Colors.white,
            //       error: Colors.cyanAccent,
            //       onError: Colors.red[800],
            //       primaryVariant: Colors.green[800],
            //       secondaryVariant: Colors.redAccent,
            //       background: Colors.grey[300],
            //       onBackground: Colors.grey[300],
            //       brightness: Brightness.light,
            //     ),
            //   ),
            //   child: child,
            // );

            return Theme(
              data: ThemeData(
                colorScheme: ColorScheme(
                  surface: Colors.grey[800],
                  onSurface: Colors.grey[200],
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  secondary: Colors.pink,
                  onSecondary: Colors.white,
                  error: Colors.cyanAccent,
                  onError: Colors.red[800],
                  primaryVariant: Colors.green[800],
                  secondaryVariant: Colors.redAccent,
                  background: Colors.grey[300],
                  onBackground: Colors.grey[300],
                  brightness: Brightness.dark,
                ),
              ),
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
        Navigator.pushNamedAndRemoveUntil(
          context,
          LogInPage.routerName,
          (route) => false,
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
    repository.checkorUncheckToDo(todo);
    this.notifyListeners();
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

  Future<void> remove(int id) async {
    await repository.removeTodo(id);
    this.notifyListeners();
  }

  Future<void> update() async {
    if (selectedTab == 1) await this.findAllForWeek();
    if (selectedTab == 2) await this.findToDosBySelectedDay();
  }
}
