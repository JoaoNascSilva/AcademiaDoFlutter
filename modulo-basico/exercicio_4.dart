/*
Exercício 4:
void main() {
    List paciente = [
        'Rodrigo Rahman|35',
        'Guilheme Rahman|10',
        'João Rahman|20',
        'Joaquin Rahman|25',
        'Luan Rahman|23'
    ];
}
Dado a lista acima faça:
  Imprima a lista acima na tela com o nome e a idade de cada paciente ex:
  Rodrigo Rahman tem 35 anos
*/

void main() {
  List paciente = [
    'Rodrigo Rahman|35',
    'Guilheme Rahman|10',
    'João Rahman|20',
    'Joaquin Rahman|25',
    'Luan Rahman|23'
  ];

  paciente.forEach(
      (p) => {print('${p.split('|')[0]} tem ${p.split('|')[1]} anos.')});
}
