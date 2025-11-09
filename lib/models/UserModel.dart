class UserModel {
  final int? id;
  final String usuario;
  final String email;
  final String senha;
  UserModel({
    this.id,
    required this.usuario,
    required this.email,
    required this.senha,
  });
  Map<String, dynamic> toMap() {
    return {"id": id, "usuario": usuario, "email": email, "senha": senha};
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      usuario: map["usuario"],
      email: map["email"],
      senha: map["senha"],
    );
  }
  @override
  String toString() {
    return "UserModel(id:$id, usuario:$usuario, email:$email, senha:$senha)";
  }
}
