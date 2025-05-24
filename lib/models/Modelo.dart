class Modelo {
  int? id;
  String userName;
  String password;
  Modelo({this.id, required this.userName, required this.password});
  Map<String, dynamic> toMap() {
    // Converte um objeto em um mapa para salvar no banco
    return {"id": id, "name": userName, "password": password};
  }

  factory Modelo.fromMap(Map<String, dynamic> map) {
    // Cria um objeto a partir de um mapa vindo do banco
    return Modelo(
      id: map['id'],
      userName: map['name'],
      password: map['password'],
    );
  }
}
