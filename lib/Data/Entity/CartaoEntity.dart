class CartaoEntity {
  int? cartaoID = 0;
  String? descricao;
  String? numero;
  String? validade;
  String? cvv;
  String? senha;

  CartaoEntity();
  CartaoEntity.comDados(this.cartaoID, this.descricao, this.numero, this.cvv,
      this.senha, this.validade);

  @override
  String toString() {
    return '$cartaoID - $descricao - $numero';
  }
}
