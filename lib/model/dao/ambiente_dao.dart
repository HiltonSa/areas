import 'package:areas/helpers/database_helper.dart';
import 'package:areas/model/ambiente.dart';
import 'package:sqflite/sqflite.dart';

class AmbienteDAO {
  String nomeTabela = 'AMBIENTES';
  AmbienteDAO();
  Future<int> inserir(Ambiente ambiente) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.insert(nomeTabela, ambiente.toMap());
    return resultado;
  }

  Future<int> alterar(Ambiente ambiente) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.update(
      nomeTabela,
      ambiente.toMap(),
      where: 'id = ?',
      whereArgs: [ambiente.id],
    );
    return resultado;
  }

  Future<int> excluir(int id) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.delete(
      nomeTabela,
      where: 'id = ?',
      whereArgs: [id],
    );
    return resultado;
  }

  Future<Ambiente> getAmbienteById(int id) async {
    Database db = await DatabaseHelper().database;
    List<Map> maps = await db.query(
      nomeTabela,
      where: "id = ?",
      whereArgs: [id],
    );
    return maps.length > 0 ? Ambiente.fromMap(maps.first) : null;
  }

  Future<List<Ambiente>> getTodosAmbientesProjeto(int idProjeto) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.query(
      nomeTabela,
      where: 'projeto = ?',
      whereArgs: [idProjeto],
    );
    List<Ambiente> lista = resultado.isNotEmpty
        ? resultado.map((e) => Ambiente.fromMap(e)).toList()
        : [];
    return lista;
  }
}
