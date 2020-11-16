import 'package:flutter/material.dart';

enum TipoTeclado {
  Texto,
  Inteiro,
  Numerico,
}

class AuxiliarWidgets {
  static TextInputType retornaTipoTeclado(tipoTeclado) {
    switch (tipoTeclado) {
      case TipoTeclado.Inteiro:
        return TextInputType.numberWithOptions(decimal: false);
        break;
      case TipoTeclado.Texto:
        return TextInputType.text;
        break;
      case TipoTeclado.Numerico:
        return TextInputType.numberWithOptions(decimal: false);
        break;
      default:
        return null;
    }
  }

  static TextAlign retornaAlinhamento(TipoTeclado tipoTeclado) {
    switch (tipoTeclado) {
      case TipoTeclado.Inteiro:
        return TextAlign.end;
        break;
      case TipoTeclado.Numerico:
        return TextAlign.end;
        break;
      case TipoTeclado.Texto:
        return TextAlign.start;
        break;
      default:
        return null;
    }
  }
}
