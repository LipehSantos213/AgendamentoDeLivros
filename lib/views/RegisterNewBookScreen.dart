// import 'package:flutter/cupertino.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterNewBookScreen extends StatefulWidget {
  const RegisterNewBookScreen({super.key});

  @override
  State<RegisterNewBookScreen> createState() => _RegisterNewBookScreenState();
}

class _RegisterNewBookScreenState extends State<RegisterNewBookScreen> {
  final Map<String, TextEditingController> controllers = {
    "nameBook": TextEditingController(),
    "nameAuthor": TextEditingController(),
    "genreBook": TextEditingController(),
    "quantifyBook": TextEditingController(),
  };
  final Map<String, GlobalKey<FormState>> formkeys = {
    "nameBook": GlobalKey<FormState>(),
    "nameAuthor": GlobalKey<FormState>(),
    "genreBook": GlobalKey<FormState>(),
    "quantifyBook": GlobalKey<FormState>(),
  };
  final genre = {
    "drama": "Drama",
    "romance": "Romance",
    "ficcaoCientifica": "Fincção Cientifica",
    "anime": "Anime",
    "hq": "Historia Em Quadrinho",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Um Novo Livro"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormText(
                      controller: controllers["nameBook"],
                      label: "Nome Do Livro",
                      hint: "nome do livro",
                      prefixIcon: Icons.bookmark_add_rounded,
                      formkey: formkeys["nameBook"],
                    ),
                  ),
                  _buildSizedBoxCustom(),
                  Expanded(
                    flex: 2,
                    child: TextFormText(
                      controller: controllers["nameAuthor"],
                      label: "Nome Do Autor",
                      hint: "nome do autor",
                      prefixIcon: Icons.account_box_sharp,
                      formkey: formkeys["nameAuthor"],
                    ),
                  ),
                ],
              ),
              _buildSizedBoxCustom(),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ShadSelect<String>(
                      placeholder: Text("Selecione o Gênero"),
                      options: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        ),
                        ...genre.entries.map(
                          (e) => ShadOption(value: e.key, child: Text(e.value)),
                        ),
                      ],
                      selectedOptionBuilder:
                          (context, value) => Text(genre[value]!),
                    ),
                  ),
                  _buildSizedBoxCustom(),
                  Expanded(
                    flex: 2,
                    child: TextFormText(
                      controller: controllers["quantifyBook"],
                      label: "Quantidade Na Biblioteca",
                      hint: "quantidade na biblioteca",
                      prefixIcon: Icons.apple_outlined,
                      formkey: formkeys["quantifyBook"],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildSizedBoxCustom() => SizedBox(width: 10, height: 20);
}
