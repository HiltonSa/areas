import 'package:areas/model/interfaces.dart';

class Ceramico implements Revestimento {
  int id;
  int tipoRevestimento;
  double rendimentoCaixa;
  String observacao;
  Ceramico({this.rendimentoCaixa, this.observacao});

  @override
  double fatorCobertura() {
    return rendimentoCaixa;
  }

  @override
  TipoRevestimento tipo() {
    return TipoRevestimento.Ceramico;
  }
}
