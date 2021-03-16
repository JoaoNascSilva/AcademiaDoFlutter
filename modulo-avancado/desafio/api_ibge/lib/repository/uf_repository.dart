import 'dart:io';

import 'package:api_ibge/data/database/DataBaseException.dart';
import 'package:api_ibge/data/database/database_connection.dart';
import 'package:api_ibge/data/rest_api.dart';
import 'package:api_ibge/model/constants.dart';
import 'package:api_ibge/model/uf.dart';
import 'package:mysql1/mysql1.dart';

class UfRepository {
  final DataBaseConnection connection;

  UfRepository(this.connection);

  Future<void> gerarUf() async {
    await this._save();
  }

  Future<void> createTableUf() async {
    final conn = await this.connection.openConnection();
    final file = File('lib/data/SQL/Uf.sql');

    try {
      var script = file.readAsStringSync();
      await conn.query(script);
    } on MySqlException catch (e) {
      print(e);
      throw new DataBaseException(message: 'Erro ao criar tabela Uf');
    }
  }

  Future<List<int>> getIdUf() async {
    final conn = await this.connection.openConnection();
    final List<int> idsUf = <int>[];
    try {
      final idsResult = await conn.query('''SELECT id FROM uf;''');
      if (idsResult.isNotEmpty) {
        idsResult.forEach((element) {
          idsUf.add(element['id'] as int);
        });

        return idsUf;
      }
      return null;
    } catch (e) {
      print(e);
      throw DataBaseException(message: 'Falha na busca dos Ids de Municipio.');
    }
    // finally {
    //   connection.closeConnection();
    // }
  }

  Future<List<Uf>> _get() async {
    var response = await RestAPI(Constants.getURL_UF()).get();
    try {
      if (response.statusCode == 200) {
        var data = response.data;
        var uf = await data.map<Uf>((e) => Uf.fromMap(e)).toList();
        return uf;
      }
    } catch (e) {
      print(e);
      throw DataBaseException(message: 'Falha na busca dos Ids de Municipio.');
    }
    // finally {
    //   connection.closeConnection();
    // }
    return null;
  }

  Future<void> _save() async {
    final conn = await connection.openConnection();

    try {
      var Uf = await this._get();

      await conn.queryMulti(
          '''INSERT INTO uf (id, sigla, nome) VALUES (?, ?, ?);''',
          Uf.map((e) => [e.id, e.sigla, e.nome]));
    } on MySqlException catch (e) {
      print(e);
      throw DataBaseException(message: 'Erro ao inserir Uf.');
    }
    // finally {
    //   await conn?.close();
    // }
  }
}
