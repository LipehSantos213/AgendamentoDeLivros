import 'package:agenda_de_livros/models/ExemplarModel.dart';

class BookModel {
  int? id;
  String titulo;
  String autor;
  String imagemCapa;
  String palavraChave;
  String genero;
  int quantidade;
  String editora;
  int anoPublicacao;
  List<ExemplarModel>? exemplares;
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
    this.exemplares,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo": titulo,
      "capa": imagemCapa,
      "palavra chave": palavraChave,
      "gênero": genero,
      "quantidade": quantidade,
      "editora": editora,
      "ano publicação": anoPublicacao,
      "exemplares": exemplares,
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
      exemplares: map["exemplares"],
    );
  }
}
