// import 'package:flutter/cupertino.dart';
import 'package:agenda_de_livros/funcs/Funcs.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

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
    "controllerExemplar1": TextEditingController(),
  };
  final Map<String, GlobalKey<FormState>> formkeys = {
    "nameBook": GlobalKey<FormState>(),
    "nameAuthor": GlobalKey<FormState>(),
    "genreBook": GlobalKey<FormState>(),
    "quantifyBook": GlobalKey<FormState>(),
    "formkeyExemplar1": GlobalKey<FormState>(),
  };
  final genre = {
    "drama": "Drama",
    "romance": "Romance",
    "ficcaoCientifica": "Fincção Cientifica",
    "anime": "Anime",
    "hq": "Historia Em Quadrinho",
  };

  int countExemplar = 1;
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
    if (lastElemetController != formkeys.keys.toList()[4] &&
        lastElementFormkeys != formkeys.keys.toList()[4]) {
      controllers.remove(lastElemetController);
      formkeys.remove(lastElementFormkeys);
    }
  }

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
              _buildRowCustomWithElement(
                TextFormText(
                  controller: controllers["nameBook"],
                  label: "Nome Do Livro",
                  hint: "nome do livro",
                  prefixIcon: Icons.bookmark_add_rounded,
                  formkey: formkeys["nameBook"],
                ),
                TextFormText(
                  controller: controllers["nameAuthor"],
                  label: "Nome Do Autor",
                  hint: "nome do autor",
                  prefixIcon: Icons.account_box_sharp,
                  formkey: formkeys["nameAuthor"],
                ),
              ),
              _buildSizedBoxCustom(),
              _buildRowCustomWithElement(
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
                ),
              ),
              ListTile(
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
                            controller:
                                controllers["conntrollerExemplar${index + 1}"],
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
                          backgroundColor: const Color.fromARGB(
                            255,
                            221,
                            217,
                            217,
                          ),
                        ),
                        child: Text("Gerar Codigo Automatico"),
                      ),
                    ],
                  ],
                ),
              ),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
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
          Funcs().clickButtonScreenNewBook(formkeys, context);
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

  Widget _buildRowCustomWithElement(Widget firstElement, Widget secundElemet) {
    return Row(
      children: [
        Expanded(flex: 2, child: firstElement),
        _buildSizedBoxCustom(),
        Expanded(flex: 2, child: secundElemet),
      ],
    );
  }

  Widget _buildSizedBoxCustom() => SizedBox(width: 10, height: 20);
}
