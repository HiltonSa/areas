import 'package:areas/ambiente_enum.dart';
import 'package:areas/model/ambiente.dart';
import 'package:areas/model/dao/ambiente_dao.dart';
import 'package:areas/model/formas/forma_enum.dart';
import 'package:areas/model/interfaces.dart';
import 'package:areas/pages/widgets/auxiliar_widgets.dart';
import 'package:areas/pages/widgets/barra_inferior.dart';
import 'package:areas/pages/widgets/barra_superior.dart';
import 'package:areas/pages/widgets/botao_texto.dart';
import 'package:areas/pages/widgets/drop_formas.dart';
import 'package:areas/pages/widgets/drop_icones.dart';
import 'package:areas/pages/widgets/mostra_campo.dart';
import 'package:areas/pages/widgets/recebe_campo.dart';
import 'package:flutter/material.dart';

class FichaAmbiente extends StatefulWidget {
  final Ambiente ambiente;

  const FichaAmbiente({Key key, this.ambiente}) : super(key: key);

  @override
  _FichaAmbienteState createState() => _FichaAmbienteState();
}

class _FichaAmbienteState extends State<FichaAmbiente> {
  Ambiente _ambiente;
  Forma _formaAmbiente;
  FormaAmbiente formato;
  IconesAmbientes icone;
  String descricao;
  double areaParedes;
  double areaPiso;
  double perimetro;
  double altura;
  double dimensaoMaior;
  double dimensaoMenor;
  AutovalidateMode _validar = AutovalidateMode.disabled;
  bool _incluir;
  GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    _ambiente = widget.ambiente;
    _incluir = widget.ambiente.id == 0;
    if (_incluir) {
      formato = FormaAmbiente.values[0];
      icone = IconesAmbientes.values[0];
      _formaAmbiente = AuxiliarForma.retornaObjeto(formato);
      descricao = '';
      areaParedes = 0.0;
      areaPiso = 0.0;
      perimetro = 0.0;
      altura = 0.0;
      dimensaoMaior = 0.0;
      dimensaoMenor = 0.0;
    } else {
      descricao = _ambiente.descricao;
      formato = FormaAmbiente.values[_ambiente.formato];
      icone = IconesAmbientes.values[_ambiente.icone];
      areaParedes = _ambiente.areaParedes;
      areaPiso = _ambiente.areaPiso;
      perimetro = _ambiente.perimetro;
      altura = _ambiente.altura;
      dimensaoMaior = _ambiente.dimensaoMaior;
      dimensaoMenor = _ambiente.dimensaoMenor;
    }
    _formaAmbiente = AuxiliarForma.retornaObjeto(formato);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.red, spreadRadius: 3, blurRadius: 25),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              color: Colors.amber,
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BarraSuperior(
                  titulo: _incluir ? 'NOVO AMBIENTE' : 'AMBIENTE',
                  botaoAcao: BotaoTexto(
                    icon: Icon(Icons.save_outlined),
                    texto: 'GRAVAR',
                    onPressed: _sendForm,
                  ),
                ),
                Form(
                  autovalidateMode: _validar,
                  key: _key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      RecebeCampo(
                        tipoTeclado: TipoTeclado.Texto,
                        salvar: (val) {
                          descricao = val;
                          _ambiente.descricao = val;
                        },
                        titulo: 'Descricao',
                        validacao: (val) {
                          if (val.isEmpty) {
                            return 'Informe a descrição do ambiente';
                          }
                          return null;
                        },
                        valorInicial: descricao,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropIcones(
                            titulo: 'Ambiente',
                            selecionado: icone,
                            change: (value) {
                              setState(() {
                                icone = value;
                                _ambiente.icone = icone.index;
                              });
                            },
                          ),
                          DropFormas(
                              titulo: 'Forma Ambiente',
                              selecionado: formato,
                              change: (value) {
                                setState(() {
                                  formato = value;
                                  _ambiente.formato = formato.index;
                                  _formaAmbiente =
                                      AuxiliarForma.retornaObjeto(formato);
                                });
                              }),
                        ],
                      ),
                      RecebeCampo(
                        tipoTeclado: TipoTeclado.Numerico,
                        change: (val) {
                          altura = double.tryParse(val);
                          _calcularDimensoes();
                        },
                        titulo: 'Altura',
                        salvar: (val) {
                          _ambiente.altura = double.tryParse(val);
                        },
                        validacao: (val) {
                          if (val.isEmpty) {
                            return 'Altura não pode ser zero';
                          }
                          return null;
                        },
                        valorInicial: altura.toString(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: RecebeCampo(
                              tipoTeclado: TipoTeclado.Numerico,
                              titulo: _formaAmbiente.nomeDimensaoMaior(),
                              change: (val) {
                                dimensaoMaior = double.tryParse(val);
                                _calcularDimensoes();
                              },
                              salvar: (val) {
                                _ambiente.dimensaoMaior = double.tryParse(val);
                              },
                              validacao: (val) {
                                if (val.isEmpty) {
                                  var tit = _formaAmbiente.nomeDimensaoMaior();
                                  return '$tit não pode ser zero';
                                }
                                return null;
                              },
                              valorInicial: dimensaoMaior.toString(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: _formaAmbiente.numeroDimensoes() > 1
                                ? RecebeCampo(
                                    change: (val) {
                                      dimensaoMenor = double.tryParse(val);
                                      _calcularDimensoes();
                                    },
                                    tipoTeclado: TipoTeclado.Numerico,
                                    titulo: _formaAmbiente.nomeDimensaoMenor(),
                                    salvar: (val) => _ambiente.dimensaoMenor =
                                        double.tryParse(val),
                                    validacao: (val) {
                                      if (val.isEmpty) {
                                        var tit =
                                            _formaAmbiente.nomeDimensaoMenor();
                                        return '$tit não pode ser zero';
                                      }
                                      return null;
                                    },
                                    valorInicial: dimensaoMaior.toString(),
                                  )
                                : null,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: MostraCampo(
                              tipoTeclado: TipoTeclado.Numerico,
                              titulo: 'Área',
                              campo: areaPiso.toString(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: MostraCampo(
                              tipoTeclado: TipoTeclado.Numerico,
                              titulo: 'Perímetro',
                              campo: perimetro.toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BarraInferior(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calcularDimensoes() {
    setState(() {
      areaPiso = _formaAmbiente.area(dimensaoMaior, dimensaoMenor);
      perimetro = _formaAmbiente.perimetro(dimensaoMaior, dimensaoMenor);
      areaParedes = perimetro * altura;
    });
  }

  void _sendForm() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _ambiente.descricao = descricao.trim();
      _ambiente.formato = formato.index;
      _ambiente.icone = icone.index;
      _ambiente.areaParedes = areaParedes;
      _ambiente.perimetro = perimetro;
      _ambiente.areaPiso = areaPiso;
      AmbienteDAO dao = AmbienteDAO();
      if (_incluir) {
        _ambiente.id = null;
        dao.inserir(_ambiente);
      } else {
        dao.alterar(_ambiente);
      }
      Navigator.of(context).pop();
    } else {
      _validar = AutovalidateMode.always;
    }
  }
}
