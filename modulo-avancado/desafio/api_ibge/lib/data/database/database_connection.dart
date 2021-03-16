import 'package:api_ibge/data/database/DataBaseException.dart';
import 'package:api_ibge/data/database/databaseconnection_configuration.dart';
import 'package:api_ibge/data/database/i_database_connection.dart';
import 'package:mysql1/mysql1.dart';

class DataBaseConnection implements IDataBaseConnection {
  MySqlConnection _connection;

  final DatabaseConnectionConfiguration _configuration =
      DatabaseConnectionConfiguration(
    databasename: 'pizza_delivery',
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'pizza_delivery',
  );

  @override
  Future<MySqlConnection> openConnection() async {
    return await MySqlConnection.connect(ConnectionSettings(
      host: this._configuration.host,
      port: this._configuration.port,
      db: this._configuration.databasename,
      user: this._configuration.user,
      password: this._configuration.password,
    ));
  }

  @override
  Future<void> closeConnection() async {
    try {
      await this._connection?.close();
      print('Conexao fechada com sucesso.');
    } on MySqlConnection catch (e) {
      print(e);
      throw DataBaseException(
          message: 'Falha ao fechar conexao com bando de dados.');
    }
  }
}
