import 'package:areas/helpers/database_helper.dart';
import 'package:areas/model/parede.dart';
import 'package:sqflite/sqflite.dart';

class ParedeDAO {
  String nomeTabela = 'PAREDES';
  ParedeDAO();
  Future<int> inserir(Parede parede) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.insert(nomeTabela, parede.toMap());
    return resultado;
  }

  Future<int> alterar(Parede parede) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.update(
      nomeTabela,
      parede.toMap(),
      where: 'ID = ?',
      whereArgs: [parede.id],
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

  Future<Parede> getParedeById(int id) async {
    Database db = await DatabaseHelper().database;
    List<Map> maps = await db.query(
      nomeTabela,
      where: "ID = ?",
      whereArgs: [id],
    );
    return maps.length > 0 ? Parede.fromMap(maps.first) : null;
  }

  Future<List<Parede>> getTodosParedesAmbiente(int idAmbiente) async {
    Database db = await DatabaseHelper().database;
    var resultado = await db.query(
      nomeTabela,
      where: 'AMBIENTE = ?',
      whereArgs: [idAmbiente],
    );
    List<Parede> lista = resultado.isNotEmpty
        ? resultado.map((e) => Parede.fromMap(e)).toList()
        : [];
    return lista;
  }
}
