class LoginModel {
  final String user;
  final String password;
  LoginModel({required this.user, required this.password});
  Map<String, dynamic> toMap() {
    return {"nome de usuario": user, "senha": password};
  }

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(user: map["nome de usuario"], password: map["senha"]);
  }
}
