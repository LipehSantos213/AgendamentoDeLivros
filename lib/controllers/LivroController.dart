import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/controllers/LoginController.dart';
import 'package:agenda_de_livros/models/LivroModel.dart';
import 'package:agenda_de_livros/database/DbHelper.dart';
import 'package:flutter/material.dart';

class LivroController {
  final DbHelper _db = DbHelper.privateConstrutor();
  Future<int> onClickSalvarLivro(
    Map<String, TextEditingController> controllers,
    Map<String, GlobalKey<FormState>> formkeys,
    BuildContext context,
  ) async {
    final camposOk = await Funcs().callValidatorTextForm(formkeys, context);
    if (camposOk) {
      print("Campos OK - Tela Cadastrar Livro");
      final controller = LoginController();
      final int? idContaAtual = await controller.pegarIdUsuario();
      if (idContaAtual != null) {
        print("Id conta atual encontrada");
        final map = {
          "id": null,
          "idConta": idContaAtual,
          "titulo": controllers["titulo"]!.text.trim(),
          "autor": controllers["autor"]!.text.trim(),
          "genero": controllers["genero"]!.text.trim(),
          "quantidade": int.parse(controllers["quantidade"]!.text.trim()),
          "editora": controllers["editora"]!.text.trim(),
          "anoPublicacao": int.parse(controllers["anoPublicacao"]!.text.trim()),
          "numeroPaginas": int.parse(controllers["numeroPaginas"]!.text.trim()),
          "edicao": controllers["edicao"]!.text.trim(),
          "idioma": controllers["idioma"]!.text.trim(),
          "localizacao": controllers["localizacao"]!.text.trim(),
        };
        final LivroModel livro = LivroModel.fromJson(map);
        print("Inserindo o Livro Novo");
        await _db.insertLivro(livro);
        return 1;
      }
      print("Id conta atual não achada");
      return 0;
    }
    print("Error, não foi possivel cadastrar");
    return 0;
    //error
  }

  Future<List<Map<String, dynamic>>> pegarLivrosDoUser() async {
    final livros = await _db.getLivros();
    return livros.map((livro) => livro.toMap()).toList();
  }
}
