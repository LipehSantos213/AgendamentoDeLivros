class LoginController {
  String? validationUserName(String username) {
    if (username.length > 40) {
      return "nome de usuario muito grande";
    } else if (username.trim().length < 8) {
      return "nome de usuario muito pequeno";
    } else if (RegExp(r'\d').hasMatch(username.substring(0, 7))) {
      return "Os 7 primeiros digitos não pode ter numero";
    }
    return null;
  }

  String? validationPassword(String password) {
    if (password.trim().length < 7) {
      return "a senha deve haver mais de 6 caracteres";
    }
    if (password.length >= 41) {
      return "a senha dever ter no maximo 40 caracteres";
    }
    return null;
  }
}
