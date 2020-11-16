import 'dart:math';

import 'package:areas/model/interfaces.dart';

class Elipse implements Forma {
  double valorPi = 3.1415;

  Elipse();

  @override
  double area(dimensaoMaior, dimensaoMenor) {
    return valorPi * dimensaoMaior * dimensaoMenor;
  }

  @override
  double perimetro(dimensaoMaior, dimensaoMenor) {
    return valorPi *
        (3 * (dimensaoMaior + dimensaoMenor) -
            (sqrt(((3 * dimensaoMaior) + dimensaoMenor) *
                (dimensaoMaior + (3 * dimensaoMenor)))));
  }

  @override
  double volume(dimensaoMaior, dimensaoMenor, altura) {
    return altura * (valorPi * dimensaoMaior * dimensaoMenor);
  }

  @override
  Formato formato() {
    return Formato.Elipse;
  }

  @override
  String nomeDimensaoMaior() {
    return 'Raio Maior';
  }

  @override
  String nomeDimensaoMenor() {
    return 'Raio Menor';
  }

  @override
  int numeroDimensoes() {
    return 2;
  }

  @override
  int numeroParedes() {
    return 1;
  }
}
