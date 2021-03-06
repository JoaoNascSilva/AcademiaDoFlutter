void main() {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  // Baseado no array acima monte um relatório onde mostre
  //  1 - Apresente a quantidade de pacientes com mais de 20 anos
  //  2 - Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia

  int pacientesAcimaDeVinteAnos = 0;
  pacientes.forEach((x) => {
        if (int.parse(x.split('|')[1]) > 20) pacientesAcimaDeVinteAnos++,
      });
  print(
      'Quantidade de pacientes com mais de 20 anos: ${pacientesAcimaDeVinteAnos}');

/**************************************************************************************************************/

  List<String> familiaRahman = [];
  List<String> familiaSilva = [];
  List<String> familiaVerne = [];

  for (var familia in pacientes) {
    //print(familia.split(' ')[1].split('|')[0]);
    final stringCompare = familia.split(' ')[1].split('|')[0];
    switch (stringCompare) {
      case 'Verne':
        familiaVerne.add(familia);
        break;
      case 'Rahman':
        familiaRahman.add(familia);
        break;
      case 'Silva':
        familiaSilva.add(familia);
        break;
    }
  }

  void imprimeFamilia(String descricaoFamilia, List<String> familias) {
    print(descricaoFamilia);
    for (var familia in familias) {
      print(
          '  ${familia.split('|')[0]} tem ${familia.split('|')[1]}, ${familia.split('|')[2]} e mora no estado de ${familia.split('|')[3]}');
    }
  }

  imprimeFamilia('Familia Verne', familiaVerne);
  imprimeFamilia('Familia Silva', familiaSilva);
  imprimeFamilia('Familia Rahman', familiaRahman);
}
