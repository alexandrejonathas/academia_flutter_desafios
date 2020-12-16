import 'dart:convert';

class Empresa {
  String tipo;
  String cor;
  String nome;
  double nota;
  String tempoMedio;
  bool melhorPreco;
  double preco;
  Empresa({
    this.tipo,
    this.cor,
    this.nome,
    this.nota,
    this.tempoMedio,
    this.melhorPreco,
    this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'cor': cor,
      'nome': nome,
      'nota': nota,
      'tempoMedio': tempoMedio,
      'melhorPreco': melhorPreco,
      'preco': preco,
    };
  }

  factory Empresa.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Empresa(
      tipo: map['tipo'],
      cor: map['cor'],
      nome: map['nome'],
      nota: map['nota'],
      tempoMedio: map['tempoMedio'],
      melhorPreco: map['melhorPreco'],
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Empresa.fromJson(String source) =>
      Empresa.fromMap(json.decode(source));
}
