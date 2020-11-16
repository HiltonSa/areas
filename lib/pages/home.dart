import 'package:areas/ambiente_enum.dart';
import 'package:areas/model/dao/projeto_dao.dart';
import 'package:areas/model/projeto.dart';
import 'package:areas/pages/widgets/icone.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProjetoDAO daoProjetos = ProjetoDAO();
  List<Projeto> projetos = [];

  _atualizaLista() {
    daoProjetos.getTodosProjetos().then((lista) {
      setState(() {
        projetos = lista;
      });
    });
  }

  @override
  initState() {
    super.initState();
    _atualizaLista();
  }

  @override
  Widget build(BuildContext context) {
    int numProjetos = projetos.length;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/fichaprojeto',
            arguments: Projeto(id: 0),
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
                child: Center(
                  child: numProjetos > 0
                      ? Text(
                          'Você tem $numProjetos projetos!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'Você não tem projetos!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
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
                itemCount: projetos.isEmpty ? 0 : projetos.length,
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
          '/projeto',
          arguments: projetos[index],
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icone(
                pathAsset:
                    AuxiliarAmbiente.retornaAsset(IconesAmbientes.Projeto),
                tamanho: 70.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projetos[index].proprietario,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      projetos[index].observacao,
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
