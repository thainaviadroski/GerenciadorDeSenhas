import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data_source.dart';

class DB_Conection {
  static Database? _database;

  static Future<Database> getConexaoDB() async {
    if (_database == null) {
      String databasesPath = join(await getDatabasesPath(), DATABASE_NAME);
      _database = await openDatabase(databasesPath, version: 1,
          onCreate: (Database db, int version) async {
        //await db.execute("DROP TABLE IF EXISTS $PERFIL_TABLE_NAME");
        await db.execute(CREATE_PERFIL_TABLE_SCRIPT);

        await db.rawInsert('''insert into $PERFIL_TABLE_NAME(
              $PERFIL_COLUMN_NOME,
              $PERFIL_COLUMN_EMAIL,
              $PERFIL_COLUMN_SENHA)
              values(
                'admin','admin@admin','123') 
              ''');
        await db.execute(CREATE_SENHA_TABLE_SCRIPT);
        await db.rawInsert('''insert into $SENHA_TABLE_NAME(
              $SENHA_COLUMN_DESCRICAO,
              $SENHA_COLUMN_LOGIN,
              $SENHA_COLUMN_SENHA)
              values(
                'admin','admin@admin','123') 
              ''');
        await db.execute(CREATE_CARTAO_TABLE_SCRIPT);

        await db.rawInsert('''insert into $CARTAO_TABLE_NAME(
              $CARTAO_COLUMN_DESCRICAO,
              $CARTAO_COLUMN_NUMERO,
              $CARTAO_COLUMN_CVV,
              $CARTAO_COLUMN_VALIDADE,
              $CARTAO_COLUMN_SENHA)
              values(
                'admin','22222222','123','12/25','xxx') 
              ''');
      });
    }
    return _database!;
  }
}
