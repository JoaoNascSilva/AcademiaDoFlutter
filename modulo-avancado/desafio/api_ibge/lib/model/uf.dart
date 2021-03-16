import 'dart:convert';

class Uf {
  final int id;
  final String sigla;
  final String nome;
  Uf({
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

  factory Uf.fromMap(Map<String, dynamic> map) {
    return Uf(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Uf.fromJson(String source) => Uf.fromMap(json.decode(source));
}
