enum Formato {
  Retangulo,
  Quadrado,
  Circulo,
  Elipse,
}

enum TipoRevestimento { Tinta, Ceramico }

abstract class Revestimento {
  TipoRevestimento tipo();
  double fatorCobertura();
}

abstract class Forma {
  int numeroDimensoes();
  int numeroParedes();
  String nomeDimensaoMenor();
  String nomeDimensaoMaior();
  Formato formato();
  double area(dimensaoMaior, dimensaoMenor);
  double volume(dimensaoMaior, dimensaoMenor, altura);
  double perimetro(dimensaoMaior, dimensaoMenor);
}

abstract class EntidadePersistivel {
  static String nomeTabela;
  static String nomeId;
  Map<String, dynamic> toMap();
  EntidadePersistivel fromMap(Map<String, dynamic> map);
}
