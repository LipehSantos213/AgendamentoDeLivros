import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaCadastrarLeitor extends StatefulWidget {
  const TelaCadastrarLeitor({super.key});

  @override
  State<TelaCadastrarLeitor> createState() => _TelaCadastrarLeitorState();
}

class _TelaCadastrarLeitorState extends State<TelaCadastrarLeitor> {
  final controllers = {
    "nome": TextEditingController(),
    "sobrenome": TextEditingController(),
    "telefone": TextEditingController(),
    "endereço": TextEditingController(),
    "data_nascimento": TextEditingController(),
  };

  final formkeys = {
    "nome": GlobalKey<FormState>(),
    "sobrenome": GlobalKey<FormState>(),
    "telefone": GlobalKey<FormState>(),
    "endereço": GlobalKey<FormState>(),
    "data_nascimento": GlobalKey<FormState>(),
  };

  Widget buildSizedBox() => SizedBox(width: 10, height: 20);

  Widget buildRowCustom(Widget firstElement, Widget secundElement) {
    return Row(
      children: [
        Expanded(child: firstElement),
        buildSizedBox(),
        Expanded(child: secundElement),
      ],
    );
  }

  Widget textCustom(String data) =>
      Text(data, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700));

  bool isEmail = false;
  bool isTelefone = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Cadastrar Leitor"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 30),
              buildRowCustom(
                TextFormText(
                  controller: controllers["nome"],
                  label: "Nome",
                  hint: "nome",
                  prefixIcon: Icons.person_sharp,
                  formkey: formkeys["nome"],
                ),
                TextFormText(
                  controller: controllers["sobrenome"],
                  label: "Sobrenome",
                  hint: "sobrenome",
                  prefixIcon: Icons.person_sharp,
                  formkey: formkeys["sobrenome"],
                ),
              ),

              // buildSizedBox(),
              SizedBox(height: 10),

              buildRowCustom(textCustom("Endereço"), textCustom("Nascimento")),
              SizedBox(height: 6),

              buildRowCustom(
                TextFormText(
                  controller: controllers["telefone"],
                  label: "Rua",
                  hint: "rua",
                  prefixIcon: Icons.phone,
                  formkey: formkeys["teleefone"],
                ),
                TextFormText(
                  controller: controllers["endereço"],
                  label: "Dia",
                  hint: "dia",
                  prefixIcon: Icons.abc,
                  formkey: formkeys["endereço"],
                ),
              ),
              buildSizedBox(),

              buildRowCustom(
                TextFormText(
                  controller: controllers["data_nacimento"],
                  label: "Bairro",
                  hint: "bairro",
                  prefixIcon: Icons.navigate_next_rounded,
                  formkey: formkeys["data_nascimento"],
                ),
                TextFormText(
                  controller: controllers[""],
                  label: "Mês",
                  hint: "mês",
                  prefixIcon: Icons.abc,
                  formkey: formkeys[""],
                ),
              ),

              buildSizedBox(),

              buildRowCustom(
                TextFormText(
                  controller: controllers[""],
                  label: "CEP",
                  hint: "cep",
                  prefixIcon: Icons.add_ic_call_outlined,
                  formkey: formkeys[""],
                ),
                TextFormText(
                  controller: controllers[""],
                  label: "Ano",
                  hint: "ano",
                  prefixIcon: Icons.zoom_out_sharp,
                  formkey: formkeys[""],
                ),
              ),
              buildSizedBox(),
              textCustom("Contato"),
              TextFormText(
                controller: controllers[""],
                label: "Telefone",
                hint: "telefone",
                prefixIcon: Icons.wysiwyg_outlined,
                formkey: formkeys[""],
              ),

              buildSizedBox(),
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
