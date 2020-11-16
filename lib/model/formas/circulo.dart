import 'package:areas/model/interfaces.dart';

class Circulo implements Forma {
  double valorPi = 3.1415;

  Circulo();

  @override
  double area(dimensaoMaior, dimensaoMenor) {
    return valorPi * (dimensaoMaior * dimensaoMenor);
  }

  @override
  double perimetro(dimensaoMaior, dimensaoMenor) {
    return 2 * (valorPi * dimensaoMaior);
  }

  @override
  double volume(dimensaoMaior, dimensaoMenor, altura) {
    return altura * (valorPi * (dimensaoMaior * dimensaoMenor));
  }

  @override
  Formato formato() {
    return Formato.Circulo;
  }

  @override
  String nomeDimensaoMaior() {
    return 'Raio';
  }

  @override
  String nomeDimensaoMenor() {
    return 'Raio';
  }

  @override
  int numeroDimensoes() {
    return 1;
  }

  @override
  int numeroParedes() {
    return 1;
  }
}
