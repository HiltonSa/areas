import 'package:areas/ambiente_enum.dart';
import 'package:areas/model/ambiente.dart';
import 'package:areas/model/dao/parede_dao.dart';
import 'package:areas/model/formas/forma_enum.dart';
import 'package:areas/model/interfaces.dart';
import 'package:areas/model/parede.dart';
import 'package:areas/pages/widgets/auxiliar_widgets.dart';
import 'package:areas/pages/widgets/barra_superior.dart';
import 'package:areas/pages/widgets/botao_texto.dart';
import 'package:areas/pages/widgets/icone.dart';
import 'package:areas/pages/widgets/mostra_campo.dart';
import 'package:flutter/material.dart';

class PageAmbiente extends StatefulWidget {
  final Ambiente ambiente;

  const PageAmbiente({Key key, this.ambiente}) : super(key: key);
  @override
  _PageAmbienteState createState() => _PageAmbienteState();
}

class _PageAmbienteState extends State<PageAmbiente> {
  ParedeDAO paredeDao = ParedeDAO();
  Forma forma;
  List<Parede> paredes = [];
  _atualizaLista() {
    paredeDao.getTodosParedesAmbiente(widget.ambiente.id).then((lista) {
      setState(() {
        paredes = lista;
      });
    });
  }

  @override
  void initState() {
    forma = AuxiliarForma.retornaObjeto(
        FormaAmbiente.values[widget.ambiente.formato]);
    _atualizaLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
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
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BarraSuperior(
                      titulo: 'AMBIENTE',
                      botaoAcao: BotaoTexto(
                        icon: Icon(Icons.create_outlined),
                        texto: 'ALTERAR',
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            '/fichaambiente',
                            arguments: widget.ambiente,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icone(
                          pathAsset: AuxiliarAmbiente.retornaAsset(
                              IconesAmbientes.values[widget.ambiente.icone]),
                          tamanho: 50,
                        ),
                        MostraCampo(
                          titulo: 'Descrição',
                          campo: widget.ambiente.descricao,
                        ),
                        Icone(
                          pathAsset: AuxiliarForma.retornaAsset(
                              FormaAmbiente.values[widget.ambiente.formato]),
                          tamanho: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MostraCampo(
                            titulo: 'Altura',
                            tipoTeclado: TipoTeclado.Numerico,
                            campo: widget.ambiente.altura.toString(),
                          ),
                          MostraCampo(
                            titulo: forma.nomeDimensaoMaior(),
                            tipoTeclado: TipoTeclado.Numerico,
                            campo: widget.ambiente.dimensaoMaior.toString(),
                          ),
                          MostraCampo(
                            titulo: forma.nomeDimensaoMenor(),
                            tipoTeclado: TipoTeclado.Numerico,
                            campo: widget.ambiente.dimensaoMenor.toString(),
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MostraCampo(
                          titulo: 'Área Piso',
                          tipoTeclado: TipoTeclado.Numerico,
                          campo: widget.ambiente.areaPiso.toString(),
                        ),
                        MostraCampo(
                          titulo: 'Área Paredes',
                          tipoTeclado: TipoTeclado.Numerico,
                          campo: widget.ambiente.areaParedes.toString(),
                        ),
                        MostraCampo(
                          titulo: 'Perímetro',
                          tipoTeclado: TipoTeclado.Numerico,
                          campo: widget.ambiente.perimetro.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 15),
                itemCount: paredes.isEmpty ? 0 : paredes.length,
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
          '/parede',
          arguments: paredes[index],
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/projeto.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paredes[index].observacao,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      paredes[index].tipoRevestimento.toString(),
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
