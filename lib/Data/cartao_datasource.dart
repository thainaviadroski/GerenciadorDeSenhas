import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Entity/CartaoEntity.dart';
import 'data_source.dart';
import 'db_conection.dart';

class CartaoDatasource {
  Future create(CartaoEntity cartao) async {
    try {
      final Database db = await DB_Conection.getConexaoDB();
      cartao.cartaoID = await db.rawInsert('''insert into $CARTAO_TABLE_NAME(
							$CARTAO_COLUMN_DESCRICAO,
							$CARTAO_COLUMN_NUMERO,
							$CARTAO_COLUMN_VALIDADE,
							$CARTAO_COLUMN_CVV)
							values(
								'${cartao.descricao}','${cartao.numero}','${cartao.validade}','${cartao.cvv}','${cartao.senha}') 
							''');
      queryAllRows();
    } catch (ex) {
      return;
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await DB_Conection.getConexaoDB();
    return await db.query(CARTAO_TABLE_NAME);
  }

  Future<List<CartaoEntity>> getAllCartoes() async {
    Database db = await DB_Conection.getConexaoDB();
    List<Map> dbResult = await db.rawQuery('SELECT * from $CARTAO_TABLE_NAME');

    List<CartaoEntity> cartoes = [];
    for (var row in dbResult) {
      CartaoEntity cartao = CartaoEntity();
      cartao.cartaoID = row['cartaoID'];
      cartao.descricao = row['descricao'];
      cartao.numero = row['numero'];
      cartao.validade = row['validade'];
      cartao.senha = row['senha'];
      cartoes.add(cartao);
    }
    return cartoes;
  }

  Future<void> updateCartao(CartaoEntity cartao) async {
    Database db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate(
          'update $CARTAO_TABLE_NAME set $CARTAO_COLUMN_DESCRICAO = ?, $CARTAO_COLUMN_NUMERO = ?, $CARTAO_COLUMN_VALIDADE = ?, $CARTAO_COLUMN_CVV = ? $CARTAO_COLUMN_SENHA '
          'where $CARTAO_COLUMN_ID = ?',
          [
            cartao.cartaoID,
            cartao.numero,
            cartao.validade,
            cartao.cvv,
            cartao.senha
          ]);
    });
  }

  Future<void> deleteCartaoID(cartaoID) async {
    Database db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('delete from $CARTAO_TABLE_NAME where id = ?', [cartaoID]);
    });
  }

  Future<void> deleteCartoes() async {
    Database db = await DB_Conection.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate('delete from $CARTAO_TABLE_NAME');
    });
  }

  Future<List<CartaoEntity>> pesquisarCartao(String filtro) async {
    List<CartaoEntity> cartoes = [];
    Database db = await DB_Conection.getConexaoDB();
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $CARTAO_TABLE_NAME where $CARTAO_COLUMN_DESCRICAO like ?',
        ['%$filtro%']);
    for (var row in dbResult) {
      CartaoEntity cartao = CartaoEntity();
      cartao.cartaoID = row['cartaoID'];
      cartao.descricao = row['descricao'];
      cartao.numero = row['numero'];
      cartao.validade = row['validade'];
      cartao.senha = row['senha'];

      cartoes.add(cartao);
    }
    return cartoes;
  }

  Future insertCartao(descricao, numero, validade, cvv, senha) async {
    final db = await DB_Conection.getConexaoDB();
    await db.rawInsert('''insert into $CARTAO_TABLE_NAME(
							$CARTAO_COLUMN_DESCRICAO,
							$CARTAO_COLUMN_NUMERO,
							$CARTAO_COLUMN_VALIDADE,
							$CARTAO_COLUMN_CVV,
							$CARTAO_COLUMN_SENHA)
							values(                
								'${descricao}','${numero}','${validade}','${cvv}','${senha}') 
							''');
  }
}
