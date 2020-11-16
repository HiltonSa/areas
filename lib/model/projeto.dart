import 'dart:convert';

import 'package:areas/model/ambiente.dart';

class Projeto {
  int id;
  String proprietario;
  String observacao;
  List<Ambiente> ambientes;
  Projeto({
    this.id,
    this.proprietario,
    this.observacao,
    this.ambientes,
  });
  List<Ambiente> getAmbientes() {
    return ambientes;
  }

  Projeto copyWith({
    int id,
    String proprietario,
    String observacao,
    List<Ambiente> ambientes,
  }) {
    return Projeto(
      id: id ?? this.id,
      proprietario: proprietario ?? this.proprietario,
      observacao: observacao ?? this.observacao,
      ambientes: ambientes ?? this.ambientes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'proprietario': proprietario,
      'observacao': observacao,
    };
  }

  factory Projeto.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Projeto(
      id: map['id'],
      proprietario: map['proprietario'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Projeto.fromJson(String source) =>
      Projeto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Projeto(id: $id, proprietario: $proprietario, observacao: $observacao)';
  }
}
