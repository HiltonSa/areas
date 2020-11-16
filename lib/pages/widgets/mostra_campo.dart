import 'package:areas/pages/widgets/auxiliar_widgets.dart';
import 'package:flutter/material.dart';

class MostraCampo extends StatelessWidget {
  final String titulo;
  final String campo;
  final TipoTeclado tipoTeclado;

  const MostraCampo({Key key, this.titulo, this.campo, this.tipoTeclado})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            campo,
            textAlign: AuxiliarWidgets.retornaAlinhamento(tipoTeclado),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
