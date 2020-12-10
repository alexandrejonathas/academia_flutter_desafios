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

  var linha = '---------------------------------------------------';

  // Baseado na lista acima.
  // 1 - Remover os duplicados
  pessoas = removerDuplicados(pessoas);
  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  print(linha);
  print('Quantidade por sexo?');
  print(linha);
  var homens = quantidadePorSexo(pessoas, 'Masculino');
  var mulheres = quantidadePorSexo(pessoas, 'Feminino');
  print('Homens: $homens');
  print('Mulheres: $mulheres');
  print(linha);
  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
  //     e mostre a quantidade de pessoas com mais de 18 anos separados por sexo
  print('Total dos maiores de 18 por sexo?');
  print(linha);
  pessoas = maiores18(pessoas);
  var homens18Mais = quantidadePorSexo(pessoas, 'masculino');
  var mulheres18Mais = quantidadePorSexo(pessoas, 'feminino');
  print('Homens: $homens18Mais');
  print('Mulheres: $mulheres18Mais');
  print(linha);
  // 4 - Encontre a pessoa mais velha.
  var pessoa = pessoaMaisVelhaOuMaisNova(pessoas);
  print(
      'A pessoa mais experiente é ${pessoa['nome']} com ${pessoa['idade']} anos.');
  print(linha);
}

List<String> removerDuplicados(List<String> pessoas) {
  return pessoas.toSet().toList();
}

int quantidadePorSexo(List<String> pessoas, String sexo) {
  return pessoas
      .where((p) => p.split('|')[2].toLowerCase() == sexo.toLowerCase())
      .fold(0, (p, e) => p += 1);
}

List<String> maiores18(List<String> pessoas) {
  pessoas.removeWhere((p) => int.tryParse(p.split('|')[1]) < 18);
  return pessoas;
}

Map<String, dynamic> pessoaMaisVelhaOuMaisNova(List<String> pessoas,
    {String ordem = 'desc'}) {
  pessoas.sort((p1, p2) => ordem.toLowerCase() == 'desc'
      ? p2.split('|')[1].compareTo(p1.split('|')[1])
      : p1.split('|')[1].compareTo(p2.split('|')[1]));
  var pessoa = pessoas[0].split('|');
  return {'nome': pessoa[0], 'idade': pessoa[1]};
}
