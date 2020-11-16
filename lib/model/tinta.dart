import 'package:areas/model/interfaces.dart';

class Tinta implements Revestimento {
  int id;
  int tipoRevestimento = TipoRevestimento.Tinta.index;
  double rendimentoLata;
  String observacao;

  Tinta({
    this.id,
    this.rendimentoLata,
    this.observacao,
  });

  @override
  double fatorCobertura() {
    return rendimentoLata;
  }

  @override
  TipoRevestimento tipo() {
    return TipoRevestimento.Tinta;
  }
}
