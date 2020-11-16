import 'package:areas/model/dao/projeto_dao.dart';
import 'package:areas/model/projeto.dart';
import 'package:areas/pages/widgets/barra_inferior.dart';
import 'package:areas/pages/widgets/barra_superior.dart';
import 'package:areas/pages/widgets/botao_texto.dart';
import 'package:flutter/material.dart';

class FichaProjeto extends StatefulWidget {
  final Projeto projeto;

  const FichaProjeto({Key key, this.projeto}) : super(key: key);
  @override
  _FichaProjetoState createState() => _FichaProjetoState();
}

class _FichaProjetoState extends State<FichaProjeto> {
  String proprietario, observacao;
  Projeto _projeto;
  AutovalidateMode _validar = AutovalidateMode.disabled;
  bool _incluir;
  GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    _incluir = widget.projeto.id == 0;
    _projeto = _incluir ? Projeto() : widget.projeto;
    proprietario = _projeto.proprietario;
    observacao = _projeto.observacao;
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
            height: MediaQuery.of(context).size.height / 2.35,
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
                  titulo: _incluir ? 'NOVO PROJETO' : 'PROJETO',
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
                      SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
                        child: TextFormField(
                          initialValue: _incluir ? '' : proprietario,
                          decoration: InputDecoration(
                              labelText: 'Proprietário',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.auto),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Informe o Proprietário do Projeto';
                            }
                            return null;
                          },
                          onSaved: (String val) {
                            proprietario = val;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
                        child: new TextFormField(
                            initialValue: observacao,
                            decoration: InputDecoration(
                                labelText: 'Observação',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                            validator: null,
                            onSaved: (String val) {
                              observacao = val;
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      )
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

  void _sendForm() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _projeto.observacao = observacao.trim();
      _projeto.proprietario = proprietario.trim();
      ProjetoDAO dao = ProjetoDAO();
      if (_incluir) {
        dao.inserir(_projeto);
      } else {
        dao.alterar(_projeto);
      }
      Navigator.of(context).pop();
    } else {
      _validar = AutovalidateMode.always;
    }
  }
}
