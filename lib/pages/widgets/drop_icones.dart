import 'package:areas/ambiente_enum.dart';
import 'package:areas/pages/widgets/icone.dart';
import 'package:flutter/material.dart';

class DropIcones extends StatefulWidget {
  final Function change;
  final IconesAmbientes selecionado;
  final String titulo;

  DropIcones({Key key, this.change, this.selecionado, this.titulo})
      : super(key: key);

  @override
  _DropIconesState createState() => _DropIconesState();
}

class _DropIconesState extends State<DropIcones> {
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
              items: IconesAmbientes.values.map((iconeAmbiente) {
                return DropdownMenuItem(
                  value: iconeAmbiente,
                  child: Row(
                    children: [
                      Icone(
                        pathAsset: AuxiliarAmbiente.retornaAsset(iconeAmbiente),
                        tamanho: 40.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AuxiliarAmbiente.retornaString(iconeAmbiente),
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
