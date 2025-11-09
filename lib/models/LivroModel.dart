class LivroModel {
  final int? id;
  final int? idConta;
  final String titulo;
  final String autor;
  final String palavraChave;
  final String genero;
  final int quantidade;
  final String editora;
  final int anoPublicacao;
  final int numeroPaginas;
  final String edicao;
  final String idioma;
  final String descricao;
  final String localizacao;

  LivroModel({
    this.id,
    this.idConta,
    required this.titulo, //
    required this.autor, //
    this.palavraChave = "", //
    required this.genero, //
    required this.quantidade, //
    required this.editora, //
    required this.anoPublicacao, //
    required this.numeroPaginas, //
    required this.edicao, //
    required this.idioma, //
    required this.descricao,
    required this.localizacao, //
  });

  // ----------------- CONVERSÃO PARA MAP -----------------
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idConta": idConta,
      "titulo": titulo,
      "autor": autor,
      "palavra_chave": palavraChave,
      "genero": genero,
      "quantidade": quantidade,
      "editora": editora,
      "ano_publicacao": anoPublicacao,
      "numero_paginas": numeroPaginas,
      "edicao": edicao,
      "idioma": idioma,
      "descricao": descricao,
      "localizacao": localizacao,
    };
  }

  // ----------------- CONVERSÃO DE MAP PARA OBJETO -----------------
  factory LivroModel.fromJson(Map<String, dynamic> map) {
    return LivroModel(
      id: map["id"],
      idConta: map["idConta"],
      titulo: map["titulo"] ?? '',
      autor: map["autor"] ?? '',
      palavraChave: map["palavra_chave"] ?? '',
      genero: map["genero"] ?? '',
      quantidade: map["quantidade"] ?? 0,
      editora: map["editora"] ?? '',
      anoPublicacao: map["ano_publicacao"] ?? 0,
      numeroPaginas: map["numero_paginas"] ?? 0,
      edicao: map["edicao"] ?? '',
      idioma: map["idioma"] ?? '',
      descricao: map["descricao"] ?? '',
      localizacao: map["localizacao"] ?? '',
    );
  }

  @override
  String toString() {
    return '''LivroModel(
      id: $id,
      idConta: $idConta,
      titulo: $titulo,
      autor: $autor,
      palavraChave: $palavraChave,
      genero: $genero,
      quantidade: $quantidade,
      editora: $edicao,
      anoPublicacao: $anoPublicacao,
      numeroPaginas: $numeroPaginas,
      edicao: $edicao,
      idioma: $idioma,
      descricao: $descricao,
      localizacao: $localizacao,
    );''';
  }
}
