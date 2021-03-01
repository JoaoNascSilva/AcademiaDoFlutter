/*
Exercício 2:
  Construa uma lista com 10 nomes.
  Imprima na tela cada nome com a frase: Sejá bem vindo NOME
*/

void main() {
  final List<String> nome = [
    'Uncle Bob',
    'Kent Beck',
    'Steve Jobs',
    'Allan Turing',
    'John Von Neuman',
    'Steve Wozniac',
    'Linus Torvalds',
    'Sergey Brin',
    'Anders Hejlberg',
    'Larry Page',
  ];

  nome.forEach((name) => print(' Seja Bem Vindo ${name}.'));
}
