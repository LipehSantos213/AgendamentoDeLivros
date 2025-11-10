import 'package:agenda_de_livros/models/LivroModel.dart';
import 'package:agenda_de_livros/database/DbHelper.dart';

class LivroController {
  final DbHelper _db = DbHelper.instance;
  Future<int> onClickSalvarLivro(LivroModel livro) async {
    return await _db.insertLivro(livro);
  }

  Future<List<LivroModel>> pegarLivros() async {
    return await _db.getLivros();
  }
}
