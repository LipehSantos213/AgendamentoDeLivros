class LoginModel {
  int? id;
  final String user;
  final String email;
  final String password;
  LoginModel({
    this.id,
    required this.user,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {"id": id, "usuario": user, "email": email, "senha": password};
  }

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      id: map["id"],
      user: map["usuario"],
      email: map["email"],
      password: map["senha"],
    );
  }
  @override
  String toString() {
    return "LoginModel(id:$id, user:$user, email:$email, password:$password)";
  }
}
