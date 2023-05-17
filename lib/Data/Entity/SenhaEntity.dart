class SenhaEntity {
  int? senhaID = 0;
  String? descricao;
  String? login;
  String? senha;

  SenhaEntity();
  SenhaEntity.comDados(this.senhaID, this.descricao, this.login, this.senha);

  @override
  String toString() {
    return '$senhaID - $descricao - $login';
  }
}
