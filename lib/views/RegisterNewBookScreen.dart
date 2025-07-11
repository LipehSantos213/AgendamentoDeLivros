// ignore: file_names
import 'package:agenda_de_livros/controllers/BookController.dart';
import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/ButtonCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class RegisterNewBookScreen extends StatefulWidget {
  const RegisterNewBookScreen({super.key});

  @override
  State<RegisterNewBookScreen> createState() => _RegisterNewBookScreenState();
}

class _RegisterNewBookScreenState extends State<RegisterNewBookScreen> {
  final BookController _bookController = BookController.privateConstrutor();
  final controllers = {
    "coverBook": TextEditingController(),
    "keywordBook": TextEditingController(),
    "nameBook": TextEditingController(),
    "nameAuthor": TextEditingController(),
    "genreBook": TextEditingController(),
    "quantifyBook": TextEditingController(),
    "publisher": TextEditingController(),
    "publicationYear": TextEditingController(),
    "controllerExemplar1": TextEditingController(),
  };

  final formkeys = {
    "coverBook": GlobalKey<FormState>(),
    "keywordBook": GlobalKey<FormState>(),
    "nameBook": GlobalKey<FormState>(),
    "nameAuthor": GlobalKey<FormState>(),
    "genreBook": GlobalKey<FormState>(),
    "quantifyBook": GlobalKey<FormState>(),
    "publisher": GlobalKey<FormState>(),
    "publicationYear": GlobalKey<FormState>(),
    "formkeyExemplar1": GlobalKey<FormState>(),
  };

  final genre = {
    "drama": "Drama",
    "romance": "Romance",
    "ficcaoCientifica": "Fincção Cientifica",
    "anime": "Anime",
    "hq": "Historia Em Quadrinho",
  };

  AppBar myAppBar() {
    return AppBar(
      title: Text("Adicionar Um Novo Livro"),
      centerTitle: true,
      leading: buildIconButton(Icons.arrow_back_rounded, () {
        Navigator.pop(context);
      }),
    );
  }

  Widget buildIconButton(IconData icone, VoidCallback onPressed) {
    return IconButton(onPressed: onPressed, icon: Icon(icone));
  }

  Widget buildRowCustomWithElement(Widget firstElement, Widget secundElemet) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: firstElement),
            SizedBox(width: 10),
            Expanded(flex: 2, child: secundElemet),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget buildButtonAddExemplar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/addexemplary"),
          child: Row(
            children: [
              Icon(Icons.keyboard_double_arrow_right_rounded),
              Text("Adicionar Exemplares"),
            ],
          ),
        ),
      ],
    );
  }

  int countExemplar = 1;
  @override
  Widget build(BuildContext context) {
    // TELA FINALIZADA !!!
    return Scaffold(
      appBar: myAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              // Campo: Capa, Palavra Chave
              buildRowCustomWithElement(
                TextFormText(
                  controller: controllers["coverBook"],
                  label: "Capa",
                  hint: "url ou imagem",
                  prefixIcon: Icons.collections,
                  formkey: formkeys["coverBook"],
                ),
                TextFormText(
                  controller: controllers["keywordBook"],
                  label: "Palavra Chave",
                  hint: "palavra para busca",
                  prefixIcon: Icons.keyboard_arrow_right_rounded,
                  formkey: formkeys["keywordBBook"],
                ),
              ),
              // Campo: titulo, Autor
              buildRowCustomWithElement(
                TextFormText(
                  controller: controllers["nameBook"],
                  label: "Titulo",
                  hint: "titulo",
                  prefixIcon: Icons.bookmark_add_rounded,
                  formkey: formkeys["nameBook"],
                ),
                TextFormText(
                  controller: controllers["nameAuthor"],
                  label: "Autor",
                  hint: "autor",
                  prefixIcon: Icons.account_box_sharp,
                  formkey: formkeys["nameAuthor"],
                ),
              ),
              // Campo: Gênero, Quantidade
              buildRowCustomWithElement(
                TextFormText(
                  controller: controllers["genreBook"],
                  label: "Gênero",
                  hint: "gênero",
                  prefixIcon: Icons.abc,
                  formkey: formkeys["genreBook"],
                ),
                TextFormText(
                  controller: controllers["quantifyBook"],
                  label: "Quantidade",
                  hint: "quantidade",
                  prefixIcon: Icons.apple_outlined,
                  formkey: formkeys["quantifyBook"],
                  number: true,
                ),
              ),
              // Campo: Editora, Ano Publicação
              buildRowCustomWithElement(
                TextFormText(
                  controller: controllers["publisher"],
                  label: "Editora",
                  hint: "editora",
                  prefixIcon: Icons.apple,
                  formkey: formkeys["publisher"],
                ),
                TextFormText(
                  controller: controllers["publicationYear"],
                  label: "Ano Publicacão",
                  hint: "ano",
                  prefixIcon: Icons.currency_yuan_rounded,
                  formkey: formkeys["publicationYear"],
                  number: true,
                ),
              ),
              TextFormText(
                controller: controllers["localização"],
                label: "Localização",
                hint: "estante A",
                prefixIcon: Icons.location_on_rounded,
                formkey: formkeys["localização"],
              ),

              // Area para colocar o codigo de livros Exemplares
              buildButtonAddExemplar(),
              SizedBox(height: 20),
              // Botão de "Salvar"
              ButtonCustom(
                onPressed: () {
                  Funcs().callValidatorTextForm(formkeys, context, "/home");
                },
                text: "Salvar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
