class GroupModel {
  int? id;
  final String imagem;
  final String nomeGrupo;
  final String descricao;
  final int quantidadePessoas;
  final String contato;

  GroupModel({
    this.id,
    required this.imagem,
    required this.nomeGrupo,
    required this.descricao,
    required this.quantidadePessoas,
    required this.contato,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "imagem": imagem,
      "nomeGrupo": nomeGrupo,
      "descricao": descricao,
      "quantidadePessoas": quantidadePessoas,
      "contato": contato,
    };
  }

  factory GroupModel.fromJson(Map<String, dynamic> map) {
    return GroupModel(
      id: map["id"],
      imagem: map["imagem"],
      nomeGrupo: map["nomeGrupo"],
      descricao: map["descricao"],
      quantidadePessoas: map["quantidadePessoas"],
      contato: map["contato"],
    );
  }
}
