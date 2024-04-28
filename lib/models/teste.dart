class Teste {
  int id;
  String descricao;

  Teste({
    required this.id,
    required this.descricao,
  });

  factory Teste.FromJson(Map<String, dynamic> json) {
    return Teste(
      id: json["id"],
      descricao: json["descricao"],
    );
  }
}
