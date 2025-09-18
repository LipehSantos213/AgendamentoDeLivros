// ignore: file_names
import 'package:agenda_de_livros/controllers/BookController.dart';
import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaCadastrarLivro extends StatefulWidget {
  const TelaCadastrarLivro({super.key});

  @override
  State<TelaCadastrarLivro> createState() => _TelaCadastrarLivroState();
}

class _TelaCadastrarLivroState extends State<TelaCadastrarLivro> {
  // final BookController _bookController = BookController.privateConstrutor();
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
    "nameBook": GlobalKey<FormState>(),
    "nameAuthor": GlobalKey<FormState>(),
    "genreBook": GlobalKey<FormState>(),
    "quantifyBook": GlobalKey<FormState>(),
    "publisher": GlobalKey<FormState>(),
    "publicationYear": GlobalKey<FormState>(),
  };

  final genre = {
    "drama": "Drama",
    "romance": "Romance",
    "ficcaoCientifica": "Fincção Cientifica",
    "anime": "Anime",
    "hq": "Historia Em Quadrinho",
  };

  Widget buildIconButton(IconData icone, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icone),
      style: IconButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(width: 2.5, color: Colors.white),
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    // TELA FINALIZADA !!!
    return Scaffold(
      appBar: AppBarCustom(title: "Cadastrar Livro"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 30),
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
              // Campo: Localização
              TextFormText(
                controller: controllers["localização"],
                label: "Localização",
                hint: "estante A",
                prefixIcon: Icons.location_on_rounded,
                formkey: formkeys["localização"],
              ),

              SizedBox(height: 20),
              // Botão de "Salvar"
              BuildButtonNavCustom(
                title: "Salvar",
                onClick: () {
                  Funcs().callValidatorTextForm(formkeys, context, "/home");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
