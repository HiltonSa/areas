import 'package:flutter/material.dart';

class BotaoTexto extends StatelessWidget {
  final Icon icon;
  final String texto;
  final Function onPressed;

  const BotaoTexto({
    Key key,
    this.icon,
    this.texto,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: icon, onPressed: onPressed),
        Text(
          texto,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
