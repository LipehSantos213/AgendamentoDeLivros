class LivroExemplarModel {
  final int? id;
  final int? idLivro;
  final String isbn;
  final int numeroExemplar;
  final String status; // "Entregue" ou "Disponivel"

  LivroExemplarModel({
    this.id,
    this.idLivro,
    required this.isbn,
    required this.numeroExemplar,
    this.status = "",
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idLivro": idLivro,
      "isbn": isbn,
      "numeroExemplar": numeroExemplar,
      "status": status,
    };
  }

  factory LivroExemplarModel.fromJson(Map<String, dynamic> map) {
    return LivroExemplarModel(
      id: map["id"],
      idLivro: map["idLivro"],
      isbn: map["isbn"],
      numeroExemplar: map["numeroExemplar"],
      status: map["stauts"] ?? "Disponivel",
    );
  }

  @override
  String toString() {
    return '''LivroExemplarModel(
      id: $id,
      idLivro: $idLivro,
      isbn: $isbn,
      numeroExemplar: $numeroExemplar,
      status: $status,
    );''';
  }
}
