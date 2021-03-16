import 'package:mysql1/mysql1.dart';

abstract class IDataBaseConnection {
  Future<MySqlConnection> openConnection();
  Future<void> closeConnection();
}
