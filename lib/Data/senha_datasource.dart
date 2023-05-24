import 'Entity/SenhaEntity.dart';
import 'data_source.dart';
import 'db_conection.dart';

class SenhaDataSource {
  Future insertSenha(descricao, login, senha) async {
    final db = await DB_Conection.getConexaoDB();
    senha.senhaID = await db.rawInsert('''insert into $SENHA_TABLE_NAME(
              $SENHA_COLUMN_DESCRICAO,
              $SENHA_COLUMN_LOGIN,
              $SENHA_COLUMN_SENHA)
              values(
                '${descricao}','${login}','${senha}') 
              ''');
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await DB_Conection.getConexaoDB();
    return await db.query(SENHA_TABLE_NAME);
  }

  Future<List<SenhaEntity>> getAllSenha() async {
    final db = await DB_Conection.getConexaoDB();
    List<Map> result = await db.rawQuery('SELECT * from $SENHA_TABLE_NAME');

    List<SenhaEntity> senhas = [];
    for (var row in result) {
      SenhaEntity senha = SenhaEntity();
      senha.senhaID = row['senhaID'];
      senha.descricao = row['descricao'];
      senha.login = row['login'];
      senha.senha = row['senha'];
      senhas.add(senha);
    }
    return senhas;
  }

  Future<SenhaEntity> getSenhaId(senhaID) async {
    final db = await DB_Conection.getConexaoDB();
    var result = await db.rawQuery(
        'SELECT senhaID from $SENHA_TABLE_NAME where $SENHA_COLUMN_ID = $senhaID');
    SenhaEntity senha = SenhaEntity();
    var dbItem = result.first;
    senha.senhaID = dbItem['senhaID'] as int?;
    senha.descricao = dbItem['descricao'] as String?;
    senha.login = dbItem['login'] as String?;
    senha.senha = dbItem['senha'] as String?;
    return senha;
  }

  Future<void> updateSenha(SenhaEntity senha) async {
    final db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate(
          'update $SENHA_TABLE_NAME set $SENHA_COLUMN_DESCRICAO = ?, $SENHA_COLUMN_LOGIN = ?, $SENHA_COLUMN_SENHA = ? where id = ?',
          [senha.descricao, senha.login, senha.senha]);
    });
  }

  Future<void> deleteSenhaID(senhaId) async {
    final db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('delete from $SENHA_TABLE_NAME where id = ?', [senhaId]);
    });
  }

  Future<void> deleteSenhas() async {
    final db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate('delete from $SENHA_TABLE_NAME ');
    });
  }

  Future<List<SenhaEntity>> pesquisarSenha(String filtro) async {
    List<SenhaEntity> senhas = [];
    final db = await DB_Conection.getConexaoDB();
    List<Map> result = await db.rawQuery(
        'SELECT * from $SENHA_TABLE_NAME where $SENHA_COLUMN_DESCRICAO like ?',
        ['%$filtro%']);
    for (var row in result) {
      SenhaEntity senha = SenhaEntity();
      senha.senhaID = row['senhaID'];
      senha.descricao = row['descricao'];
      senha.login = row['login'];
      senha.senha = row['senha'];
      senhas.add(senha);
    }
    return senhas;
  }

  Future<bool> getSenhaEmail(String filtro) async {
    final db = await DB_Conection.getConexaoDB();
    List<Map> result = await db.rawQuery(
        'SELECT * from $SENHA_TABLE_NAME where $SENHA_COLUMN_LOGIN = ?',
        ['$filtro']);

    if (result.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
