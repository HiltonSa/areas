import 'package:flutter/material.dart';

import 'botao_texto.dart';

class BarraSuperior extends StatelessWidget {
  final String titulo;
  final BotaoTexto botaoAcao;

  const BarraSuperior({Key key, this.titulo, this.botaoAcao}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          BotaoTexto(
            icon: Icon(Icons.chevron_left),
            texto: 'VOLTAR',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            titulo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          botaoAcao,
        ],
      ),
    );
  }
}
