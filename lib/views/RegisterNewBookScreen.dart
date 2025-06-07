// import 'package:flutter/cupertino.dart';

import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class RegisterNewBookScreen extends StatefulWidget {
  const RegisterNewBookScreen({super.key});

  @override
  State<RegisterNewBookScreen> createState() => _RegisterNewBookScreenState();
}

class _RegisterNewBookScreenState extends State<RegisterNewBookScreen> {
  final Map<String, TextEditingController> controllers = {
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

  final Map<String, GlobalKey<FormState>> formkeys = {
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

  void addControllerAndFormkey() {
    controllers.addAll({
      "controllerExemplar$countExemplar": TextEditingController(),
    });
    formkeys.addAll({"formkeyExemplar$countExemplar": GlobalKey<FormState>()});
  }

  void removeControllerAndFormkey() {
    String lastElemetController = controllers.keys.toList().elementAt(
      controllers.keys.toList().length - 1,
    );
    String lastElementFormkeys = formkeys.keys.toList().elementAt(
      formkeys.keys.toList().length - 1,
    );
    if (lastElemetController != "controllerExemplar1" &&
        lastElementFormkeys != "formkeyExemplar1") {
      controllers.remove(lastElemetController);
      formkeys.remove(lastElementFormkeys);
    }
  }

  void printControllersAndFormkeys() {
    for (String element in controllers.keys) {
      print("Controllers: $element");
    }
    for (String element in formkeys.keys) {
      print("Formkey: $element");
    }
  }

  Widget buildIconButton(IconData icone, VoidCallback onPressed) {
    return IconButton(onPressed: onPressed, icon: Icon(icone));
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Funcs().callValidatorTextForm(formkeys, context, "/home");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 175, 238, 177),
        ),
        child: Text(
          "Salvar",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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

  Widget buildTextForTextForExemplarBook() {
    return ListTile(
      title: Row(
        children: [
          Text("Exemplares: "),
          Expanded(child: Container()),
          buildIconButton(Icons.remove, () {
            setState(() {
              countExemplar = countExemplar - 1;
              if (countExemplar <= 0) {
                countExemplar = 1;
              }
              removeControllerAndFormkey();
            });
          }),
          buildIconButton(Icons.add, () {
            setState(() {
              countExemplar = countExemplar + 1;
              addControllerAndFormkey();
            });
          }),
        ],
      ),
      subtitle: Column(
        children: [
          Column(
            children: List.generate(countExemplar, (index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormText(
                  controller: controllers["conntrollerExemplar${index + 1}"],
                  label: "Exemplar${index + 1}",
                  hint: "exemplar${index + 1}",
                  prefixIcon: Icons.navigate_next,
                  formkey: formkeys["formkeyExemplar${index + 1}"],
                ),
              );
            }),
          ),
          if (countExemplar < 2) ...[
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 217, 217),
              ),
              child: Text("Gerar Codigo Automatico"),
            ),
          ],
        ],
      ),
    );
  }

  int countExemplar = 1;
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
              // Area para colocar o codigo de livros Exemplares
              buildTextForTextForExemplarBook(),
              // Botão de "Salvar"
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
