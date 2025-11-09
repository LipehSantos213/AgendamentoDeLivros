class EmprestimoModel {
  final int? id;
  final int? idExemplar;
  final int? idLeitor; //  ID da pessoa (se tiver cadastro no sistema)
  final String nomePessoa; // Nome do leitor (para exibição)
  final String livroEmprestado; // Título do livro
  final DateTime dataEmprestimo;
  final DateTime dataDevolucaoPrevista; //  Data limite para devolver
  final DateTime? dataDevolucaoEfetiva; // Quando realmente devolveu
  final bool devolvido; // Indica se o livro foi devolvido
  final String observacoes; // Notas ou observações adicionais
  final String status; // Ex: "Em andamento", "Atrasado", "Concluído"

  EmprestimoModel({
    this.id,
    this.idExemplar,
    this.idLeitor,
    required this.nomePessoa,
    required this.livroEmprestado,
    required this.dataEmprestimo,
    required this.dataDevolucaoPrevista,
    this.dataDevolucaoEfetiva,
    this.devolvido = false,
    this.observacoes = "",
    this.status = "Em andamento",
  });

  // ----------------- CONVERSÃO PARA MAP -----------------
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "id_pessoa": idLeitor,
      "nome_pessoa": nomePessoa,
      "livro_emprestado": livroEmprestado,
      "data_emprestimo": dataEmprestimo.toIso8601String(),
      "data_devolucao_prevista": dataDevolucaoPrevista.toIso8601String(),
      "data_devolucao_efetiva": dataDevolucaoEfetiva?.toIso8601String(),
      "devolvido": devolvido ? 1 : 0,
      "observacoes": observacoes,
      "status": status,
    };
  }

  // ----------------- CONVERSÃO DE MAP PARA OBJETO -----------------
  factory EmprestimoModel.fromMap(Map<String, dynamic> map) {
    return EmprestimoModel(
      id: map["id"],
      idLeitor: map["id_pessoa"],
      nomePessoa: map["nome_pessoa"] ?? "",
      livroEmprestado: map["livro_emprestado"] ?? "",
      dataEmprestimo: DateTime.parse(map["data_emprestimo"]),
      dataDevolucaoPrevista: map["data_devolucao_prevista"],
      dataDevolucaoEfetiva:
          map["data_devolucao_efetiva"] != null
              ? DateTime.parse(map["data_devolucao_efetiva"])
              : null,
      devolvido: (map["devolvido"] ?? 0) == 1,
      observacoes: map["observacoes"] ?? "",
      status: map["status"] ?? "Em andamento",
    );
  }

  @override
  String toString() {
    return '''
EmprestimoModel{
  id: $id, 
  idLeitor: $idLeitor,
  nomePessoa: $nomePessoa, 
  livroEmprestado: $livroEmprestado, 
  dataEmprestimo: $dataEmprestimo, 
  dataDevolucaoPrevista: $dataDevolucaoPrevista, 
  dataDevolucaoEfetiva: $dataDevolucaoEfetiva, 
  devolvido: $devolvido, 
  status: $status, 
  observacoes: $observacoes
}''';
  }
}
