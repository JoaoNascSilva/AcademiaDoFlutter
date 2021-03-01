/*
Exercício 3:
  Crie uma variável com o nome Pedro de Alcântara Francisco Antônio João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon
  Imprima a quantidade de nomes que essa variavel tem.
  Dica: Lembre do método (split)
*/

void main() {
  final String name =
      'Pedro de Alcântara Francisco Antônio João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon';

  print(name.split(" ").length);

  //Removendo: de, e
  print('Removendo ( de ) e ( e )');
  print(name.replaceAll(' de', '').replaceAll(' e', '').split(" ").length);
}
