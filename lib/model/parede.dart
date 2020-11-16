import 'dart:convert';

class Parede {
  int id;
  int ambiente;
  double area;
  double altura;
  int tipoRevestimento;
  String observacao;
  Parede({
    this.id,
    this.ambiente,
    this.altura,
    this.tipoRevestimento,
    this.observacao,
    this.area,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ambiente': ambiente,
      'altura': altura,
      'area': area,
      'tipoRevestimento': tipoRevestimento,
      'observacao': observacao,
    };
  }

  factory Parede.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Parede(
      id: map['id'],
      ambiente: map['ambiente'],
      area: map['area'],
      altura: map['altura'],
      tipoRevestimento: map['tipoRevestimento'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Parede.fromJson(String source) => Parede.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Parede(id: $id, area: $area, tipoRevestimento: $tipoRevestimento, observacao: $observacao)';
  }
}
