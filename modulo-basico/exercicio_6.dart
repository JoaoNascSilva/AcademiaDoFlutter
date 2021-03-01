/*
Exercício 6:
void main() {
    List paciente = [
        'Rodrigo Rahman|35',
        'Guilheme Rahman|10',
        'João Rahman|17',
        'Joaquin Rahman|28',
        'Luan Rahman|23',
    ];
}
Dado a lista acima faça:
  Remova da lista os pacientes que são menor de idade.
  Imprima a lista acima na tela com o nome e a idade de cada paciente ex:
    Rodrigo Rahman tem 35 anos
*/

void main() {
  List paciente = [
    'Rodrigo Rahman|35',
    'Guilheme Rahman|10',
    'João Rahman|17',
    'Joaquin Rahman|28',
    'Luan Rahman|23',
  ];

  paciente.removeWhere((p) => int.tryParse(p.split('|')[1]) < 18);
  paciente.forEach(
      (p) => {print('${p.split('|')[0]} tem ${p.split('|')[1]} anos.')});
}
