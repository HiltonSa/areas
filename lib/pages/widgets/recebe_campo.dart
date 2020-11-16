import 'package:flutter/material.dart';

import 'auxiliar_widgets.dart';

class RecebeCampo extends StatelessWidget {
  final String titulo;
  final String valorInicial;
  final Function validacao;
  final Function salvar;
  final Function change;
  final TipoTeclado tipoTeclado;

  const RecebeCampo(
      {Key key,
      this.titulo,
      this.valorInicial,
      this.validacao,
      this.salvar,
      this.tipoTeclado,
      this.change})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: TextFormField(
        onChanged: change,
        textAlign: AuxiliarWidgets.retornaAlinhamento(tipoTeclado),
        keyboardType: AuxiliarWidgets.retornaTipoTeclado(tipoTeclado),
        initialValue: valorInicial,
        decoration: InputDecoration(
          labelText: titulo,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: validacao,
        onSaved: salvar,
      ),
    );
  }
}
