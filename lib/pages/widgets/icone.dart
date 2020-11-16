import 'package:flutter/material.dart';

class Icone extends StatelessWidget {
  final String pathAsset;
  final double tamanho;

  const Icone({
    Key key,
    this.pathAsset,
    this.tamanho,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(pathAsset),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
