import 'package:areas/model/formas/circulo.dart';
import 'package:areas/model/formas/elipse.dart';
import 'package:areas/model/formas/quadrado.dart';
import 'package:areas/model/formas/retangulo.dart';

import '../interfaces.dart';

enum FormaAmbiente { Retangulo, Quadrado, Circulo, Elipse }

class AuxiliarForma {
  static retornaString(FormaAmbiente formaAmbiente) {
    switch (formaAmbiente) {
      case FormaAmbiente.Circulo:
        return 'Círculo';
        break;
      case FormaAmbiente.Elipse:
        return 'Elipse';
        break;
      case FormaAmbiente.Quadrado:
        return 'Quadrado';
        break;
      case FormaAmbiente.Retangulo:
        return 'Retangulo';
        break;
      default:
        return null;
    }
  }

  static retornaAsset(FormaAmbiente formaAmbiente) {
    switch (formaAmbiente) {
      case FormaAmbiente.Circulo:
        return 'assets/images/circulo.png';
        break;
      case FormaAmbiente.Elipse:
        return 'assets/images/elipse.png';
        break;
      case FormaAmbiente.Quadrado:
        return 'assets/images/quadrado.png';
        break;
      case FormaAmbiente.Retangulo:
        return 'assets/images/retangulo.png';
        break;
      default:
        return null;
    }
  }

  static Forma retornaObjeto(FormaAmbiente formaAmbiente) {
    switch (formaAmbiente) {
      case FormaAmbiente.Circulo:
        return Circulo();
        break;
      case FormaAmbiente.Elipse:
        return Elipse();
        break;
      case FormaAmbiente.Quadrado:
        return Quadrado();
        break;
      case FormaAmbiente.Retangulo:
        return Retangulo();
        break;
      default:
        return null;
    }
  }
}
