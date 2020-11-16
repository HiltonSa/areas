import 'package:areas/model/interfaces.dart';

class Retangulo implements Forma {
  Retangulo();

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
    return Formato.Retangulo;
  }

  @override
  String nomeDimensaoMaior() {
    return 'Lado Maior';
  }

  @override
  String nomeDimensaoMenor() {
    return 'Lado Menor';
  }

  @override
  int numeroDimensoes() {
    return 2;
  }

  @override
  int numeroParedes() {
    return 4;
  }
}
