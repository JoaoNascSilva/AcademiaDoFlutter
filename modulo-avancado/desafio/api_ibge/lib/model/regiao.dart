import 'dart:convert';

class Regiao {
  final int id;
  final String sigla;
  final String nome;

  Regiao({
    this.id,
    this.sigla,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory Regiao.fromMap(Map<String, dynamic> map) {
    return Regiao(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Regiao.fromJson(String source) => Regiao.fromMap(json.decode(source));
}
