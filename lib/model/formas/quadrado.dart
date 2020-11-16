import 'package:areas/model/interfaces.dart';

class Quadrado implements Forma {
  Quadrado();

  @override
  double area(dimensaoMaior, dimensaoMenor) {
    return dimensaoMaior * dimensaoMenor;
  }

  @override
  double perimetro(dimensaoMaior, dimensaoMenor) {
    return (dimensaoMaior + dimensaoMenor) * 2;
  }

  @override
  double volume(dimensaoMaior, dimensaoMenor, altura) {
    return (dimensaoMaior * dimensaoMenor) * altura;
  }

  @override
  Formato formato() {
    return Formato.Quadrado;
  }

  @override
  String nomeDimensaoMaior() {
    return 'Lado';
  }

  @override
  String nomeDimensaoMenor() {
    return '';
  }

  @override
  int numeroDimensoes() {
    return 1;
  }

  @override
  int numeroParedes() {
    return 4;
  }
}
