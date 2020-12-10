import 'dart:convert';

class EstadoModel {
  int id;
  String nome;
  String sigla;

  EstadoModel({
    this.id,
    this.nome,
    this.sigla,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
    };
  }

  factory EstadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EstadoModel(
      id: map['id'],
      nome: map['nome'],
      sigla: map['sigla'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EstadoModel.fromJson(String source) =>
      EstadoModel.fromMap(json.decode(source));
}
