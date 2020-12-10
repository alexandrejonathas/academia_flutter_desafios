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
  // Apresente a quantidade de pacientes com mais de 20 anos
  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.

  List<String> familias = [];

  pacientes.removeWhere((p) {
    var dados = p.split('|');
    var nome = dados[0].split(' ');

    if (!familias.contains(nome[1])) {
      familias.add(nome[1]);
    }
    return int.tryParse(dados[1]) < 21;
  });

  var linha = '---------------------------------------------------------';

  print(linha);
  print('Pacientes com mais de 20 anos: ${pacientes.length}');
  print(linha);

  for (String familia in familias) {
    print('Família $familia:');

    for (String p in pacientes) {
      var dados = p.split('|')[0].split(' ');

      if (dados.contains(familia)) {
        print('---${dados[0]}');
      }
    }

    print(linha);
  }
}
