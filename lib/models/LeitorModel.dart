class LeitorModel {
  final int? id;
  final String nome;
  final String sobrenome;
  final String telefone;
  final String email;
  final String rua;
  final String bairro;
  final String cep;
  final String cidade;
  final String dataNascimento;

  LeitorModel({
    this.id,
    required this.nome,
    required this.sobrenome,
    required this.telefone,
    required this.email,
    required this.rua,
    required this.bairro,
    required this.cep,
    required this.cidade,
    required this.dataNascimento,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "email": email,
      "rua": rua,
      "bairro": bairro,
      "cep": cep,
      "cidade": cidade,
      "dataNascimento": dataNascimento,
    };
  }
}
