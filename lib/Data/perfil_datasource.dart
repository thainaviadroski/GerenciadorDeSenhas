import 'Entity/ProfileEntity.dart';
import 'db_conection.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'data_source.dart';

class PerfilDatasource {
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await DB_Conection.getConexaoDB();
    return await db.query(PERFIL_TABLE_NAME);
  }

  Future insertPerfil(nome, email, pass) async {
    try {
      final Database db = await DB_Conection.getConexaoDB();

      await db.rawInsert('''insert into $PERFIL_TABLE_NAME(
        $PERFIL_COLUMN_NOME,  $PERFIL_COLUMN_EMAIL, $PERFIL_COLUMN_SENHA
      ) values ('${nome}','${email}', '${pass}') ''');

      queryAllRows();
    } catch (err) {
      return;
    }
  }

  Future<bool> isLogin(login, pass) async {
    Database db = await DB_Conection.getConexaoDB();
    List<Map> result = await db.rawQuery(
        'SELECT * FROM $PERFIL_TABLE_NAME where $PERFIL_COLUMN_EMAIL = $login and $PERFIL_COLUMN_SENHA = $pass');

    if (result.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<PerfilEntity>> findAllPerfis() async {
    Database db = await DB_Conection.getConexaoDB();
    List<Map> result = await db.rawQuery('');

    List<PerfilEntity> perfis = [];

    for (var row in result) {
      PerfilEntity perfil = PerfilEntity();

      perfil.perfilID = row['perfilID'];
      perfil.nome = row['nome'];
      perfil.email = row['email'];

      perfis.add(perfil);
    }
    return perfis;
  }

  Future<bool> getPerfil(login, senha) async {
    Database db = await DB_Conection.getConexaoDB();
    List<Map> result = await db.rawQuery(
        'SELECT * from $PERFIL_TABLE_NAME where $PERFIL_COLUMN_EMAIL = $login and $PERFIL_COLUMN_SENHA = $senha');

    if (result.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> updatePerfil(PerfilEntity perfil) async {
    Database db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate(
          'update $PERFIL_TABLE_NAME set $PERFIL_COLUMN_NOME = ?, $PERFIL_COLUMN_EMAIL = ?, $PERFIL_COLUMN_SENHA = ? where id = ?',
          [perfil.nome, perfil.email, perfil.senha]);
    });
  }

  Future<void> deletePerfil(perfilID) async {
    Database db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('delete from $PERFIL_TABLE_NAME where id = ?', [perfilID]);
    });
  }

  Future<List<PerfilEntity>> searchPerfil(String filtro) async {
    List<PerfilEntity> perfis = [];
    Database db = await DB_Conection.getConexaoDB();
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $PERFIL_TABLE_NAME where $PERFIL_COLUMN_NOME like ?',
        ['%$filtro%']);
    for (var row in dbResult) {
      PerfilEntity perfil = PerfilEntity();
      perfil.perfilID = row['perfilID'];
      perfil.nome = row['nome'];
      perfil.email = row['email'];
      perfis.add(perfil);
    }
    return perfis;
  }

  Future<String> getPerfilLogado(email) async {
    Database db = await DB_Conection.getConexaoDB();
    String nome = "";
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $PERFIL_TABLE_NAME where $PERFIL_COLUMN_EMAIL = $email ');

    for (var row in dbResult) {
      nome = row['nome'];
    }
    return nome;
  }
}
