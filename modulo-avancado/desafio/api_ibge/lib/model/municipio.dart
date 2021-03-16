import 'dart:convert';

class Municipio {
  final int id;
  final int iduf;
  final String nome;

  Municipio({this.id, this.iduf, this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iduf': iduf,
      'nome': nome,
    };
  }

  factory Municipio.fromMap(Map<String, dynamic> map) {
    return Municipio(
      id: map['id'],
      iduf: map['iduf'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Municipio.fromJson(String source) =>
      Municipio.fromMap(json.decode(source));
}
