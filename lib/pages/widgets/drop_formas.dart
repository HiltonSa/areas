import 'package:areas/model/formas/forma_enum.dart';
import 'package:areas/pages/widgets/icone.dart';
import 'package:flutter/material.dart';

class DropFormas extends StatefulWidget {
  final Function change;
  final FormaAmbiente selecionado;
  final String titulo;

  DropFormas({Key key, this.change, this.selecionado, this.titulo})
      : super(key: key);

  @override
  _DropFormasState createState() => _DropFormasState();
}

class _DropFormasState extends State<DropFormas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.titulo,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton(
              value: widget.selecionado,
              items: FormaAmbiente.values.map((formaAmbiente) {
                return DropdownMenuItem(
                  value: formaAmbiente,
                  child: Row(
                    children: [
                      Icone(
                        pathAsset: AuxiliarForma.retornaAsset(formaAmbiente),
                        tamanho: 40.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AuxiliarForma.retornaString(formaAmbiente),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: widget.change,
            ),
          ]),
    );
  }
}
