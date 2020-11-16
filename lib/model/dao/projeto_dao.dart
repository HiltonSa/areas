import 'package:areas/helpers/database_helper.dart';
import 'package:areas/model/projeto.dart';
import 'package:sqflite/sqflite.dart';

class ProjetoDAO {
  String nomeTabela = 'PROJETOS';
  ProjetoDAO();
  Future<int> inserir(Projeto projeto) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.insert(nomeTabela, projeto.toMap());
    return resultado;
  }

  Future<int> alterar(Projeto projeto) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.update(
      nomeTabela,
      projeto.toMap(),
      where: 'ID = ?',
      whereArgs: [projeto.id],
    );
    return resultado;
  }

  Future<int> excluir(int id) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.delete(
      nomeTabela,
      where: 'ID = ?',
      whereArgs: [id],
    );
    return resultado;
  }

  Future<Projeto> getProjetoById(int id) async {
    Database db = await DatabaseHelper().database;
    List<Map> maps = await db.query(
      nomeTabela,
      where: "ID = ?",
      whereArgs: [id],
    );
    return maps.length > 0 ? Projeto.fromMap(maps.first) : null;
  }

  Future<List<Projeto>> getTodosProjetos() async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.query(nomeTabela);
    List<Projeto> lista = resultado.isNotEmpty
        ? resultado.map((e) => Projeto.fromMap(e)).toList()
        : [];
    return lista;
  }
}
