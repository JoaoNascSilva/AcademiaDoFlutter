import 'package:revenda_gas/app/database/connection.dart';
import 'package:revenda_gas/app/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDosRepository {
  Future<List<ToDoModel>> findByPeriod(DateTime start, DateTime end) async {
    var startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    var endFilter = DateTime(end.year, end.month, end.day, 23, 59, 59);
    var sharedPreferencesUser = await SharedPreferences.getInstance();

    var conn = await Connection().instance;
    var result = await conn.rawQuery(
      'SELECT id, description, date_hour, isfinished FROM todo WHERE date_hour BETWEEN ? AND ?  AND iduser = ? ORDER BY date_hour;',
      [
        startFilter.toIso8601String(),
        endFilter.toIso8601String(),
        sharedPreferencesUser.getInt('idUser'),
      ],
    );

    return result.map((t) => ToDoModel.fromMap(t)).toList();
  }

  Future<void> saveToDo(DateTime dateTimeTask, String description) async {
    var conn = await Connection().instance;
    var sharedPreferencesUser = await SharedPreferences.getInstance();

    conn.rawInsert(
      '''INSERT INTO todo VALUES (?,?,?,?,?);''',
      [
        null,
        description,
        dateTimeTask.toIso8601String(),
        0,
        sharedPreferencesUser.getInt('idUser'),
      ],
    );
  }

  Future<void> checkorUncheckToDo(ToDoModel todo) async {
    var conn = await Connection().instance;
    conn.rawUpdate(
      'UPDATE todo SET isfinished = ? WHERE id = ?;',
      [todo.isfinished ? 1 : 0, todo.id],
    );
  }

  Future<void> removeTodo(int idTodo) async {
    var conn = await Connection().instance;
    await conn.rawDelete('DELETE FROM todo WHERE id = ?;', [idTodo]);
  }
}
