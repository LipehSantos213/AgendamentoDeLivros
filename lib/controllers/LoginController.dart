// ignore: file_names
// import 'package:flutter/material.dart' show TextEditingController;
import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/UserModel.dart';
import '../database/DbHelper.dart';

class LoginController {
  void addControllerAndFormkeyInConfirmSenha(
    Map<String, TextEditingController> controllers,
    Map<String, GlobalKey<FormState>> formkeys,
    bool criarConta,
  ) {
    if (criarConta) {
      if (controllers.keys.last != "confirmPassword" &&
          formkeys.keys.last != "confirmPassword") {
        controllers.addAll({"confirmPassword": TextEditingController()});
        formkeys.addAll({"confirmPassword": GlobalKey<FormState>()});
      }
    } else {
      String ultimoForm = formkeys.keys.last;
      String ultimoController = controllers.keys.last;
      if (ultimoController == "confirmPassword" &&
          ultimoForm == "confirmPassword") {
        controllers.remove(ultimoController);
        formkeys.remove(ultimoForm);
      }
    }
  }

  Future<void> onClickButton(
    bool isCreateAccount,
    BuildContext context,
    Map<String, TextEditingController> controllers,
    Map<String, GlobalKey<FormState>> formkeys,
  ) async {
    final isCamposOk = await Funcs().callValidatorTextForm(formkeys, context);

    final user = controllers["user"]!.text.trim();
    final email = controllers["email"]!.text.trim();
    final senha = controllers["password"]!.text.trim();

    final login = UserModel(usuario: user, email: email, senha: senha);

    if (isCreateAccount && isCamposOk) {
      // Criar Conta
      final confirmSenha = controllers["confirmPassword"]?.text.trim();
      if (senha != confirmSenha) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("As senhas não coincidem. Tente novamente!"),
          ),
        );
        return;
      }

      String result = await db.insertUser(login);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
      Navigator.popAndPushNamed(context, "/home");
    } else {
      // Acessar Conta
      final isAutorizate = await db.accessAccount(login);
      if (isAutorizate) {
        // IR PARA A TELA PRINCIPAL -> MENU
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seja Bem vindo de Volta ${login.usuario}')),
        );
        Navigator.popAndPushNamed(context, "/home");
      } else if (!isCreateAccount && isCamposOk) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Credenciais Invalidas !!!")));
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

  String? validationConfirmPasword(String confirmsenha, String senha) {
    if (confirmsenha.trim() != senha.trim()) {
      return "Confirme sua senha novamente";
    }
    return null;
  }

  Future<String> criarConta(UserModel conta) async {
    return await db.insertUser(conta);
  }

  Future<void> removeUser(int id) async {}

  Future buscarLivros() async {}
}
