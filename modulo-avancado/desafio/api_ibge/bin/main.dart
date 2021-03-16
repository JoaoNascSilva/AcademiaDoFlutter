import 'package:api_ibge/data/database/database_connection.dart';
import 'package:api_ibge/repository/municipio_repository.dart';
import 'package:api_ibge/repository/regiao_repository.dart';
import 'package:api_ibge/repository/uf_repository.dart';

final DataBaseConnection connection = DataBaseConnection();

void main() async {
  print('Carga de dados INICIALIZADA.');

  print('Conectando na base de dados...');

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
