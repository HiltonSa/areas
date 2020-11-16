import 'package:flutter/material.dart';

enum IconesAmbientes {
  Projeto,
  QuartoCasal,
  QuartoSolteiro,
  Cozinha,
  Lavabo,
  Banheiro,
  SalaEstar
}

class AuxiliarAmbiente {
  static retornaString(IconesAmbientes iconesAmbientes) {
    switch (iconesAmbientes) {
      case IconesAmbientes.Banheiro:
        return 'Banheiro';
        break;

      case IconesAmbientes.Projeto:
        return 'Projeto';
        break;
      case IconesAmbientes.QuartoCasal:
        return 'Quarto Casal';
        break;
      case IconesAmbientes.QuartoSolteiro:
        return 'Quarto Solteiro';
        break;
      case IconesAmbientes.Cozinha:
        return 'Cozinha';
        break;
      case IconesAmbientes.Lavabo:
        return 'Lavabo';
        break;
      case IconesAmbientes.SalaEstar:
        return 'Sala Estar';
        break;
      default:
        return null;
    }
  }

  static String retornaAsset(IconesAmbientes iconesAmbientes) {
    switch (iconesAmbientes) {
      case IconesAmbientes.Banheiro:
        return 'assets/images/bath.jpg';
        break;

      case IconesAmbientes.Projeto:
        return 'assets/images/projeto.png';
        break;
      case IconesAmbientes.QuartoCasal:
        return 'assets/images/bedroom_couple.png';
        break;
      case IconesAmbientes.QuartoSolteiro:
        return 'assets/images/bedroom_single.png';
        break;
      case IconesAmbientes.Cozinha:
        return 'assets/images/kitchen.png';
        break;
      case IconesAmbientes.Lavabo:
        return 'assets/images/lavabo.png';
        break;
      case IconesAmbientes.SalaEstar:
        return 'assets/images/living_room.png';
        break;
      default:
        return null;
    }
  }

  static ImageIcon retornaIcon(IconesAmbientes iconesAmbientes) {
    switch (iconesAmbientes) {
      case IconesAmbientes.Banheiro:
        return ImageIcon(AssetImage('assets/images/bath.jpg'));
        break;

      case IconesAmbientes.Projeto:
        return ImageIcon(AssetImage('assets/images/projeto.png'));
        break;
      case IconesAmbientes.QuartoCasal:
        return ImageIcon(AssetImage('assets/images/bedroom_couple.png'));
        break;
      case IconesAmbientes.QuartoSolteiro:
        return ImageIcon(AssetImage('assets/images/bedroom_single.png'));
        break;
      case IconesAmbientes.Cozinha:
        return ImageIcon(AssetImage('assets/images/kitchen.png'));
        break;
      case IconesAmbientes.Lavabo:
        return ImageIcon(AssetImage('assets/images/lavabo.png'));
        break;
      case IconesAmbientes.SalaEstar:
        return ImageIcon(AssetImage('assets/images/living_room.png'));
        break;
      default:
        return null;
    }
  }
}
