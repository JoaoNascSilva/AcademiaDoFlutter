import 'dart:io';

import 'package:api_ibge/application/DataBaseException.dart';
import 'package:api_ibge/data/database/database_connection.dart';
import 'package:api_ibge/data/rest_api.dart';
import 'package:api_ibge/model/constantes/constants.dart';
import 'package:api_ibge/model/municipio.dart';
import 'package:api_ibge/repository/uf_repository.dart';
import 'package:mysql1/mysql1.dart';

class MunicipioRepository {
  DataBaseConnection conn;

  MunicipioRepository(this.conn);

  Future<void> createTableMunicipio() async {
    final conn = await this.conn.openConnection();
    final file = File('lib/data/SQL/municipio.sql');

    try {
      var script = file.readAsStringSync();
      await conn.query(script);
    } on MySqlException catch (e) {
      print(e);
      throw new DataBaseException(
        message: 'Erro ao criar tabela Municipio',
        exception: e.message,
      );
    }
  }

  Future<void> gerarMunicipio() async {
    final idsUf = await this._get();

    for (var id in idsUf) {
      await this._save(id);
    }
  }

  Future<List<int>> _get() async {
    final ufRepository = UfRepository(conn);
    var idsUf = ufRepository.getIdUf();
    return idsUf;
  }

  Future<void> _save(int idUF) async {
    var connection = await this.conn.openConnection();
    var response = await RestAPI(Constants.getURLMunicipio(idUF)).get();

    if (response.statusCode == 200) {
      var respData = response.data;
      var municipios = respData.map((m) => Municipio.fromMap(m)).toList();

      for (var municipio in municipios) {
        print('Id: ${municipio.id}, idUF: ${idUF}, Cidade: ${municipio.nome}');
        await connection.query(
            'INSERT INTO municipio (id, iduf, nome) VALUES (?, ?, ?);',
            [municipio.id, idUF, municipio.nome]);
      }
    }
  }
}
