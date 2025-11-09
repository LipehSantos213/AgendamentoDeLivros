import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaCadastrarLivro extends StatefulWidget {
  const TelaCadastrarLivro({super.key});

  @override
  State<TelaCadastrarLivro> createState() => _TelaCadastrarLivroState();
}

class _TelaCadastrarLivroState extends State<TelaCadastrarLivro> {
  final controllers = {
    "titulo": TextEditingController(),
    "autor": TextEditingController(),
    "genero": TextEditingController(),
    "quantidade": TextEditingController(),
    "editora": TextEditingController(),
    "anoPublicacao": TextEditingController(),
    "numeroPaginas": TextEditingController(),
    "idioma": TextEditingController(),
    "descricao": TextEditingController(),
    "edicao": TextEditingController(),
    "palavraChave": TextEditingController(),
    "localizacao": TextEditingController(),
  };

  final formkeys = {
    "titulo": GlobalKey<FormState>(),
    "autor": GlobalKey<FormState>(),
    "genero": GlobalKey<FormState>(),
    "quantidade": GlobalKey<FormState>(),
    "editora": GlobalKey<FormState>(),
    "anoPublicacao": GlobalKey<FormState>(),
    "numeroPaginas": GlobalKey<FormState>(),
    "idioma": GlobalKey<FormState>(),
    "descricao": GlobalKey<FormState>(),
    "edicao": GlobalKey<FormState>(),
    "palavraChave": GlobalKey<FormState>(),
    "localizacao": GlobalKey<FormState>(),
  };

  TextFormText buildFormTextField(
    String keyName,
    String label,
    String hint,
    IconData icon, {
    bool isNumber = false,
  }) {
    return TextFormText(
      controller: controllers[keyName],
      label: label,
      hint: hint,
      prefixIcon: icon,
      formkey: formkeys[keyName],
      number: isNumber,
    );
  }

  Widget buildSizedBox() => const SizedBox(height: 18);

  Widget buildRowCustom(Widget first, Widget second) {
    return Row(
      children: [
        Expanded(child: first),
        const SizedBox(width: 12),
        Expanded(child: second),
      ],
    );
  }

  Widget buildButton() {
    bool _isPressed = false;
    return StatefulBuilder(
      builder: (context, setStateButton) {
        return GestureDetector(
          onTapDown: (_) => setStateButton(() => _isPressed = true),
          onTapUp: (_) {
            setStateButton(() => _isPressed = false);
            Future.delayed(
              const Duration(milliseconds: 120),
              () => Funcs().callValidatorTextForm(formkeys, context, "/home"),
            );
          },
          onTapCancel: () => setStateButton(() => _isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient:
                  _isPressed
                      ? const LinearGradient(
                        colors: [Colors.white, Colors.white70],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                      : const LinearGradient(
                        colors: [Color(0xFF6A1B9A), Colors.black87],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Salvar Livro",
                style: TextStyle(
                  color: _isPressed ? Colors.black : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration decorationContainer() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Cadastrar Livro"),
      backgroundColor: const Color(0xFFF9F9F9),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: decorationContainer(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dados do Livro",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    buildSizedBox(),
                    // Titulo : Autor
                    buildRowCustom(
                      buildFormTextField(
                        "titulo",
                        "Título",
                        "Digite o título",
                        Icons.book_outlined,
                      ),
                      buildFormTextField(
                        "autor",
                        "Autor",
                        "Digite o autor",
                        Icons.person_outline,
                      ),
                    ),
                    buildSizedBox(),
                    // Genero : Quantidade
                    buildRowCustom(
                      buildFormTextField(
                        "genero",
                        "Gênero",
                        "Ex: Romance, Drama",
                        Icons.category_outlined,
                      ),
                      buildFormTextField(
                        "quantidade",
                        "Quantidade",
                        "Ex: 10",
                        Icons.numbers_outlined,
                        isNumber: true,
                      ),
                    ),
                    buildSizedBox(),
                    // Editora : Ano Publi
                    buildRowCustom(
                      buildFormTextField(
                        "editora",
                        "Editora",
                        "Nome da editora",
                        Icons.business_outlined,
                      ),
                      buildFormTextField(
                        "anoPublicacao",
                        "Ano de Publicação",
                        "Ex: 2025",
                        Icons.calendar_today_outlined,
                        isNumber: true,
                      ),
                    ),
                    buildSizedBox(),
                    // Numero de Paginas : Idioma
                    buildRowCustom(
                      buildFormTextField(
                        "numeroPaginas",
                        "Num. De Paginas",
                        "Ex: 10",
                        Icons.abc,
                        isNumber: true,
                      ),
                      buildFormTextField(
                        "idioma",
                        "Idioma",
                        "Ex: Português",
                        Icons.label_important,
                      ),
                    ),
                    buildSizedBox(),
                    // ISBN : Edição --------------------
                    buildRowCustom(
                      buildFormTextField(
                        "descricao",
                        "Descrição",
                        "descrição",
                        Icons.youtube_searched_for,
                      ),
                      buildFormTextField(
                        "edicao",
                        "Edição",
                        "edição do livro",
                        Icons.access_alarm_rounded,
                      ),
                    ),
                    buildSizedBox(),
                    // Palavra Chave : Localização
                    buildRowCustom(
                      buildFormTextField(
                        "palavraChave",
                        "Palavra Chave",
                        "palavra p/ buscar",
                        Icons.search_rounded,
                      ),
                      buildFormTextField(
                        "localizacao",
                        "Localização",
                        "Ex: Estante A - Prateleira 3",
                        Icons.location_on_outlined,
                      ),
                    ),
                    buildSizedBox(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }
}
