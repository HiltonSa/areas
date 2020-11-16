import 'dart:convert';

import 'package:areas/model/interfaces.dart';
import 'package:areas/model/parede.dart';

class Ambiente implements EntidadePersistivel {
  static String nomeTabela = 'AMBIENTES';
  static String nomeId = 'ID';
  int id;
  int formato;
  int projeto;
  int icone;
  String descricao;
  double areaParedes;
  double areaPiso;
  double perimetro;
  double altura;
  double dimensaoMaior;
  double dimensaoMenor;
  List<Parede> paredes;
  Ambiente({
    this.id,
    this.projeto,
    this.formato,
    this.icone,
    this.altura,
    this.descricao,
    this.areaParedes,
    this.areaPiso,
    this.perimetro,
    this.dimensaoMaior,
    this.dimensaoMenor,
  });
  List<Parede> getParedes() {
    return paredes;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'formato': formato,
      'icone': icone,
      'projeto': projeto,
      'descricao': descricao,
      'areaParedes': areaParedes,
      'altura': altura,
      'areaPiso': areaPiso,
      'perimetro': perimetro,
      'dimensaoMaior': dimensaoMaior,
      'dimensaoMenor': dimensaoMenor,
    };
  }

  factory Ambiente.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ambiente(
      id: map['id'],
      formato: map['formato'],
      icone: map['icone'],
      projeto: map['projeto'],
      descricao: map['descricao'],
      areaParedes: map['areaParedes'],
      altura: map['altura'],
      areaPiso: map['areaPiso'],
      perimetro: map['perimetro'],
      dimensaoMenor: map['dimensaoMenor'],
      dimensaoMaior: map['dimensaoMaior'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ambiente.fromJson(String source) =>
      Ambiente.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ambiente(id: $id, formato: $formato, descricao: $descricao, areaParedes: $areaParedes, areaPiso: $areaPiso, perimetro: $perimetro)';
  }

  @override
  EntidadePersistivel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ambiente(
      id: map['id'],
      formato: map['formato'],
      icone: map['icone'],
      projeto: map['projeto'],
      descricao: map['descricao'],
      areaParedes: map['areaParedes'],
      altura: map['altura'],
      areaPiso: map['areaPiso'],
      perimetro: map['perimetro'],
      dimensaoMenor: map['dimensaoMenor'],
      dimensaoMaior: map['dimensaoMaior'],
    );
  }
}
