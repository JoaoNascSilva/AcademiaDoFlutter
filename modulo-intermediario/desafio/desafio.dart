void main() {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //pessoas.toSet().forEach((x) => print(x));
  print('[Inicio] Total de Pessoas: ${pessoas.length}');
  // Baseado na lista acima.
  print('\n*** 1 - Remover os duplicados ***');

  Set naoDuplicados = Set();
  pessoas.forEach((x) => {naoDuplicados.add(x)});
  naoDuplicados.forEach((x) => {
        print(
            'Nome: ${x.split('|')[0]} Idade: ${x.split('|')[1]} Sexo: ${x.split('|')[2]}'),
      });
  print('[Apos Remocao Duplicados] Total de Pessoas: ${naoDuplicados.length}');

  print(
      '\n*** 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino ***');
  var quantidadePessoasSexoMasculino =
      naoDuplicados.where((x) => x.split('|')[2].contains('Masculino'));
  print(
      'Quantidade de Pessoas do sexo masculino: ${quantidadePessoasSexoMasculino.length}');

  var quantidadePessoasSexoFeminino =
      naoDuplicados.where((x) => x.split('|')[2].contains('Feminino'));
  print(
      'Quantidade de Pessoas do sexo Feminino: ${quantidadePessoasSexoFeminino.length}');

  print(
      '\n*** 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e mostre a quantidade de pessoas com mais de 18 anos ***');
  naoDuplicados.removeWhere((x) => int.tryParse(x.split('|')[1]) < 18);
  naoDuplicados.forEach((x) => {
        print(
            'Nome: ${x.split('|')[0]} Idade: ${x.split('|')[1]} Sexo: ${x.split('|')[2]}'),
      });
  print('Quantidade de Pessoas maiores de Idade: ${naoDuplicados.length}');

  print('\n*** 4 - Encontre a pessoa mais velha. ***');
  pessoas.sort((value1, value2) => int.parse(value1.split('|')[1])
      .compareTo(int.parse(value2.split('|')[1])));

  print(
      'A pessoa mais velha e: ${pessoas.last.split('|')[0]} com ${pessoas.last.split('|')[1]} anos');
}
