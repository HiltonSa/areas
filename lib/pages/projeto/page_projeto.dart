import 'package:areas/ambiente_enum.dart';
import 'package:areas/model/dao/ambiente_dao.dart';
import 'package:areas/pages/widgets/barra_superior.dart';
import 'package:areas/pages/widgets/botao_texto.dart';
import 'package:areas/pages/widgets/mostra_campo.dart';
import 'package:flutter/material.dart';

import 'package:areas/model/ambiente.dart';
import 'package:areas/model/projeto.dart';

class PageProjeto extends StatefulWidget {
  final Projeto projeto;

  const PageProjeto({Key key, this.projeto}) : super(key: key);
  _PageProjetoState createState() => _PageProjetoState();
}

class _PageProjetoState extends State<PageProjeto> {
  AmbienteDAO daoAmbiente = AmbienteDAO();

  List<Ambiente> ambientes = [];
  _atualizaLista() {
    daoAmbiente.getTodosAmbientesProjeto(widget.projeto.id).then((lista) {
      setState(() {
        ambientes = lista;
      });
    });
  }

  @override
  void initState() {
    _atualizaLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/fichaambiente',
            arguments: Ambiente(
              projeto: widget.projeto.id,
              id: 0,
            ),
          );
          _atualizaLista();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BarraSuperior(
                      titulo: 'PROJETO',
                      botaoAcao: BotaoTexto(
                        icon: Icon(Icons.create_outlined),
                        texto: 'ALTERAR',
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            '/fichaprojeto',
                            arguments: widget.projeto,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MostraCampo(
                      titulo: 'Proprietário',
                      campo: widget.projeto.proprietario,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MostraCampo(
                      titulo: 'Descrição',
                      campo: widget.projeto.observacao,
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red, spreadRadius: 3, blurRadius: 25),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  color: Colors.amber,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 15),
                itemCount: ambientes.isEmpty ? 0 : ambientes.length,
                itemBuilder: (context, index) {
                  return _listTile(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _listTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/ambiente',
          arguments: ambientes[index],
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AuxiliarAmbiente.retornaAsset(
                        IconesAmbientes.values[ambientes[index].icone])),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ambientes[index].descricao,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ambientes[index].areaPiso.toString(),
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
