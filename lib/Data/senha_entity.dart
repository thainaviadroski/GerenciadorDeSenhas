const String DATABASE_NAME = 'db_passmaneger';

const String SENHA_TABLE_NAME = 'senhas';
const String SENHA_COLUMN_ID = 'senhaid';
const String SENHA_COLUMN_LOGIN = 'login';
const String SENHA_COLUMN_DESCRICAO = 'descricao';
const String SENHA_COLUMN_SENHA = 'senha';

const String CREATE_TABLE_SCRIPT = '''
  CREATE TABLE $SENHA_TABLE_NAME (
    $SENHA_TABLE_NAME 
    $SENHA_COLUMN_ID INTEGER PRIMARY KEY,
    $SENHA_COLUMN_LOGIN TEXT,
    $SENHA_COLUMN_DESCRICAO TEXT,
    $SENHA_COLUMN_SENHA TEXT,    
  )

''';
