import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaCatalogarLivro extends StatefulWidget {
  const TelaCatalogarLivro({super.key});

  @override
  State<TelaCatalogarLivro> createState() => _TelaCatalogarLivroState();
}

class _TelaCatalogarLivroState extends State<TelaCatalogarLivro> {
  Widget textCustom(String data) =>
      Text(data, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700));

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

  final controllers = {
    "nome_completo": TextEditingController(),
    "contato": TextEditingController(),
    "titulo": TextEditingController(),
    "exemplar": TextEditingController(),
  };
  final formkeys = {
    "nome_completo": GlobalKey<FormState>(),
    "contato": GlobalKey<FormState>(),
    "titulo": GlobalKey<FormState>(),
    "exemplar": GlobalKey<FormState>(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Catalogação de Livro"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30),
            buildRowCustom(
              TextFormText(
                controller: controllers["nome_completo"],
                label: "Nome Completo",
                hint: "nome completo",
                prefixIcon: Icons.nest_cam_wired_stand,
                formkey: formkeys["nome_completo"],
              ),
              TextFormText(
                controller: controllers["contato"],
                label: "Contato",
                hint: "contato",
                prefixIcon: Icons.wallet_giftcard_sharp,
                formkey: formkeys["contato"],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
