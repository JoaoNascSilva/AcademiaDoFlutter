import 'dart:io';

import 'package:api_ibge/application/DataBaseException.dart';
import 'package:api_ibge/data/database/database_connection.dart';
import 'package:api_ibge/data/rest_api.dart';
import 'package:api_ibge/model/constantes/constants.dart';
import 'package:api_ibge/model/regiao.dart';
import 'package:mysql1/mysql1.dart';

class RegiaoRepository {
  final DataBaseConnection connection;

  RegiaoRepository(this.connection);

  Future<void> gerarRegiao() async {
    await this._save();
  }

  Future<void> createTableRegiao() async {
    final conn = await this.connection.openConnection();
    final file = File('lib/data/SQL/regiao.sql');

    try {
      var script = file.readAsStringSync();
      await conn.query(script);
    } on MySqlException catch (e) {
      print(e);
      throw DataBaseException(message: 'Erro ao criar tabela regiao');
    }
  }

  Future<List<Regiao>> _get() async {
    var response = await RestAPI(Constants.getURLRegiao()).get();

    if (response.statusCode == 200) {
      var data = response.data;
      var regiao = await data.map<Regiao>((e) => Regiao.fromMap(e)).toList();
      return regiao;
    }

    return null;
  }

  Future<void> _save() async {
    final conn = await connection.openConnection();

    try {
      var regiao = await this._get();

      await conn.queryMulti(
          '''INSERT INTO regiao (id, sigla, nome) VALUES (?, ?, ?);''',
          regiao.map((e) => [e.id, e.sigla, e.nome]));
    } on MySqlException catch (e) {
      print(e);
      throw DataBaseException(message: 'Erro ao inserir regiao.');
    }
    // finally {
    //   await conn?.close();
    // }
  }
}
