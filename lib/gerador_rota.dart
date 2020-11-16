import 'package:areas/model/ambiente.dart';
import 'package:areas/model/projeto.dart';
import 'package:areas/pages/ambiente/ficha_ambiente.dart';
import 'package:areas/pages/ambiente/page_ambiente.dart';
import 'package:areas/pages/home.dart';
import 'package:areas/pages/projeto/page_projeto.dart';
import 'package:areas/pages/projeto/ficha_projeto.dart';
import 'package:flutter/material.dart';

class GeradorRotas {
  static Route<dynamic> gerarRota(RouteSettings settings) {
    final arqs = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case '/projeto':
        if (arqs is Projeto) {
          return MaterialPageRoute(
              builder: (_) => PageProjeto(
                    projeto: arqs,
                  ));
        } else {
          return _errorRoute();
        }
        break;
      case '/fichaprojeto':
        if (arqs is Projeto) {
          return MaterialPageRoute(
              builder: (_) => FichaProjeto(
                    projeto: arqs,
                  ));
        } else {
          return _errorRoute();
        }
        break;
      case '/fichaambiente':
        if (arqs is Ambiente) {
          return MaterialPageRoute(
              builder: (_) => FichaAmbiente(
                    ambiente: arqs,
                  ));
        } else {
          return _errorRoute();
        }
        break;
      case '/ambiente':
        if (arqs is Ambiente) {
          return MaterialPageRoute(
              builder: (_) => PageAmbiente(
                    ambiente: arqs,
                  ));
        } else {
          return _errorRoute();
        }
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
        ),
        body: Center(
          child: Text('ERRO'),
        ),
      );
    });
  }
}
