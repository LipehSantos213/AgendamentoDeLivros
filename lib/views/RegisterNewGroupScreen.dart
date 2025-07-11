// ignore_for_file: unused_field

import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/controllers/GroupController.dart';
import 'package:agenda_de_livros/widgets/ButtonCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class RegisterNewGroupScreen extends StatefulWidget {
  const RegisterNewGroupScreen({super.key});

  @override
  State<RegisterNewGroupScreen> createState() => _RegisterNewGroupScreenState();
}

class _RegisterNewGroupScreenState extends State<RegisterNewGroupScreen> {
  final controllers = {
    "imagem": TextEditingController(),
    "nomeGrupo": TextEditingController(),
    "descrição": TextEditingController(),
    "quantidadePessoas": TextEditingController(),
    "contato": TextEditingController(),
  };

  final formkeys = {
    "imagem": GlobalKey<FormState>(),
    "nomeGrupo": GlobalKey<FormState>(),
    "descrição": GlobalKey<FormState>(),
    "quantidadePessoas": GlobalKey<FormState>(),
    "contato": GlobalKey<FormState>(),
  };

  AppBar myAppBar() {
    return AppBar(
      title: Text("Adicionar Grupo", style: TextStyle(fontSize: 27)),
      centerTitle: true,
      leading: buildIconButton(
        Icons.arrow_back_rounded,
        () => Navigator.pop(context),
      ),
    );
  }

  Widget buildIconButton(IconData icone, Function onPressed) =>
      IconButton(onPressed: () => onPressed(), icon: Icon(icone));

  Widget buildRowCustom(Widget firstElement, Widget secundElement) {
    return Row(
      children: [
        Expanded(child: firstElement),
        buildSizedBox(),
        Expanded(child: secundElement),
      ],
    );
  }

  Widget buildButtonAddPeople() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/viewreaders"),
          child: Row(
            children: [
              Icon(Icons.keyboard_double_arrow_right_outlined),

              Text("Adicionar Pessoas"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ButtonCustom(
            onPressed: () {
              Funcs().callValidatorTextForm(formkeys, context, "/home");
            },
            text: "Salvar",
          ),
        ),
        Expanded(
          child: ButtonCustom(
            onPressed: () {
              print("Butao  Consultar Clicado !!");
            },
            text: "Consultar",
          ),
        ),
      ],
    );
  }

  Widget buildSizedBox() => SizedBox(width: 10, height: 20);
  final _controller = GroupController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              // Campos de: Imagem e Nome Do Grupo
              buildRowCustom(
                TextFormText(
                  controller: controllers["imagem"],
                  label: "Imagem",
                  hint: "imagem ou url",
                  prefixIcon: Icons.image,
                  formkey: formkeys["imagem"],
                ),
                TextFormText(
                  controller: controllers["nomeGrupo"],
                  label: "Nome Do Grupo",
                  hint: "nome do grupo",
                  prefixIcon: Icons.group_add,
                  formkey: formkeys["nomeGroup"],
                ),
              ),

              buildSizedBox(),

              // Campo de: Descrição e Quantas Pessoas
              buildRowCustom(
                TextFormText(
                  controller: controllers["descrição"],
                  label: "Descrição",
                  hint: "descrição",
                  prefixIcon: Icons.description_rounded,
                  formkey: formkeys["descrição"],
                ),
                TextFormText(
                  controller: controllers["quantidadePessoas"],
                  label: "Quantas Pessoas",
                  hint: "quantidade",
                  prefixIcon: Icons.person,
                  formkey: formkeys["quantidadePessoas"],
                  number: true,
                ),
              ),

              buildSizedBox(),

              // Campo de: Contato
              TextFormText(
                controller: controllers["contato"],
                label: "Contato",
                hint: "(11) 1111-1111",
                prefixIcon: Icons.phone,
                formkey: formkeys["contato"],
              ),

              buildButtonAddPeople(),

              buildSizedBox(),

              buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }
}
