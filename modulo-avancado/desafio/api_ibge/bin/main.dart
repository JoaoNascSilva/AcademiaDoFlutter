import 'package:api_ibge/application/DataBaseException.dart';
import 'package:api_ibge/data/database/database_connection.dart';
import 'package:api_ibge/repository/municipio_repository.dart';
import 'package:api_ibge/repository/regiao_repository.dart';
import 'package:api_ibge/repository/uf_repository.dart';
import 'package:mysql1/mysql1.dart';

final DataBaseConnection connection = DataBaseConnection();

Future<void> limparBaseDeDados() async {
  try {
    var conn = await connection.openConnection();
    //await conn.query('''BEGIN;''');
    await conn
      ..query('''DROP TABLE pizza_delivery.municipio;''');
    await conn
      ..query('''DROP TABLE pizza_delivery.uf;''');
    await conn
      ..query('''DROP TABLE pizza_delivery.regiao;''');
    //await conn.query('''COMMIT;''');
  } on MySqlException catch (e) {
    print(e);
    throw DataBaseException(message: 'Erro ao inserir regiao.');
  }
}

void main() async {
  print('Carga de dados INICIALIZADA.');

  print('Conectando na base de dados...');

  // limparBaseDeDados();

  var regiaoRepository = RegiaoRepository(connection);
  var ufRepository = UfRepository(connection);
  var municipioRepository = MunicipioRepository(connection);

  print('Criando tabelas...');
  await ufRepository.createTableUf();
  await regiaoRepository.createTableRegiao();
  await municipioRepository.createTableMunicipio();

  print('Populando tabela [ UF ]..');
  await ufRepository.gerarUf();

  print('Populando tabela [ REGIAO ]..');
  await regiaoRepository.gerarRegiao();

  print('Populando tabela [ MUNICIPIO ]..');
  await municipioRepository.gerarMunicipio();

  print('Tabelas populadas com sucesso...');

  print('Fechando conexao com banco de dados.');
  await connection.closeConnection();

  print('Carga de dados FINALIZADA.');
}
