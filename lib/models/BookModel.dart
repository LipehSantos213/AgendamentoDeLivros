class BookModel {
  final int? id;
  final String titulo;
  final String autor;
  final String imagemCapa;
  final String palavraChave;
  final String genero;
  final int quantidade;
  final String editora;
  final int anoPublicacao;
  BookModel({
    this.id,
    required this.titulo,
    required this.autor,
    required this.imagemCapa,
    required this.palavraChave,
    required this.genero,
    required this.quantidade,
    required this.editora,
    required this.anoPublicacao,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo": titulo,
      "autor": autor,
      "capa": imagemCapa,
      "palavra chave": palavraChave,
      "gênero": genero,
      "quantidade": quantidade,
      "editora": editora,
      "ano publicação": anoPublicacao,
    };
  }

  factory BookModel.fromJson(Map<String, dynamic> map) {
    return BookModel(
      id: map["id"],
      titulo: map["titulo"],
      autor: map["autor"],
      imagemCapa: map["capa"],
      palavraChave: map["palavra chave"],
      genero: map["gênero"],
      quantidade: map["quantidade"],
      editora: map["editora"],
      anoPublicacao: map["ano publicação"],
    );
  }
}
