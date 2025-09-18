// ignore: file_names
import 'package:flutter/material.dart' show TextEditingController;
import 'package:flutter/widgets.dart';

import '../models/LoginModel.dart';
import '../database/DbHelper.dart';

class LoginController {
  void addControllerAndFormkeyInConfirmSenha(
    Map<String, TextEditingController> controllers,
    Map<String, GlobalKey<FormState>> formkeys,
    bool criarConta,
  ) {
    print("-----LoginController-----");

    if (criarConta) {
      print("Usuario esta criando uma conta !!!");
      if (controllers.keys.last != "controllerConfirmPassword" &&
          formkeys.keys.last != "confirmPassword") {
        controllers.addAll({
          "controllerConfirmPassword": TextEditingController(),
        });
        formkeys.addAll({"confirmPassword": GlobalKey<FormState>()});
        print("Adicionado !!!");
      }
    } else {
      print("Usuario esta acessando uma conta !!!");
      String ultimoForm = formkeys.keys.last;
      String ultimoController = controllers.keys.last;
      if (ultimoController == "controllerConfirmPassword" &&
          ultimoForm == "confirmPassword") {
        controllers.remove(ultimoController);
        formkeys.remove(ultimoForm);
        print("Removidos !!!");
      }
    }
  }

  final db = DbHelper.privateConstrutor();
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

  String? validationEmail(String email) {
    if (email.trim().contains(" ")) {
      return "foi encontrado um espaço !";
    }
    if (!(email.contains("@gmail.com") ||
        email.contains("@aluno.ce.gov.br") ||
        email.contains("@hotmail.com"))) {
      return "email invalido";
    }
    String nomeUsuario = email.substring(0, email.indexOf("@"));
    if (nomeUsuario.length < 8) {
      return "O nome do email: $nomeUsuario, dever ter mais de 8 carasteres";
    }
    if (RegExp(r'[A-Z]').hasMatch(nomeUsuario)) {
      return "foi achado uma letra maiuscula, corrija";
    }
    if (RegExp(
      r'[áàâãäéèêëíìîïóòôõöúùûüçÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ]',
    ).hasMatch(email)) {
      return "não pode ter acento";
    }
    return null;
  }

  String? validationConfirmPasword(String confirmsenha, String senha) {}

  Future<int> addUser(LoginModel login) async {
    return await db.insertUser(login);
  }

  Future<void> removeUser(int id) async {}
}
