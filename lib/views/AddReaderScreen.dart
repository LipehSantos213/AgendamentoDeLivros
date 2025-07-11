import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class AddReaderScreen extends StatefulWidget {
  const AddReaderScreen({super.key});

  @override
  State<AddReaderScreen> createState() => _AddReaderScreenState();
}

class _AddReaderScreenState extends State<AddReaderScreen> {
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

  AppBar myAppBar() {
    return AppBar(
      title: Text("Adicionar um Leitor"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_rounded),
      ),
    );
  }

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

  Widget buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
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
              buildSizedBox(),
              buildRowCustom(
                TextFormText(
                  controller: controllers["telefone"],
                  label: "Telefone",
                  hint: "(11) 1111-1111",
                  prefixIcon: Icons.phone,
                  formkey: formkeys["teleefone"],
                ),
                TextFormText(
                  controller: controllers["endereço"],
                  label: "Endereço",
                  hint: "endereço",
                  prefixIcon: Icons.abc,
                  formkey: formkeys["endereço"],
                ),
              ),
              buildSizedBox(),
              TextFormText(
                controller: controllers["data_nacimento"],
                label: "Data Nascimento",
                hint: "data de nascimento",
                prefixIcon: Icons.navigate_next_rounded,
                formkey: formkeys["data_nascimento"],
              ),
              buildSizedBox(),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }
}
