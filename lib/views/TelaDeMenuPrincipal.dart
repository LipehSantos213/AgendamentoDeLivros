// ignore_for_file: file_names

import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:flutter/material.dart';

class TelaDeMenuPrincipal extends StatefulWidget {
  const TelaDeMenuPrincipal({super.key});

  @override
  State<TelaDeMenuPrincipal> createState() => _TelaDeMenuPrincipalState();
}

class _TelaDeMenuPrincipalState extends State<TelaDeMenuPrincipal> {
  AppBar myAppBar() {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,

      title: Text(
        "Home",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.3),
      ),
      centerTitle: true,
    );
  }

  Widget buildSpacing() => SizedBox(height: 30);
  // final _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70),

              BuildButtonNavCustom(
                title: "Cadastrar Livro",
                onClick: () {
                  Navigator.pushNamed(context, "/addbook");
                },
              ),
              buildSpacing(),
              BuildButtonNavCustom(
                title: "Cadastrar Leitor",
                onClick: () {
                  Navigator.pushNamed(context, "/addreader");
                },
              ),
              buildSpacing(),
              BuildButtonNavCustom(
                title: "Visualizar Biblioteca",
                onClick: () {
                  Navigator.pushNamed(context, "/viewlibrary");
                },
              ),
              buildSpacing(),
              BuildButtonNavCustom(
                title: "Catalogação de Livro",
                onClick: () {
                  Navigator.pushNamed(context, "/catalogarlivro");
                },
              ),
              buildSpacing(),
              BuildButtonNavCustom(
                title: "Consultar Livro",
                onClick: () {
                  Navigator.pushNamed(context, "/consultarlivro");
                },
              ),
              buildSpacing(),
              BuildButtonNavCustom(
                title: "Consultar Leitor",
                onClick: () {
                  Navigator.pushNamed(context, "/consultarleitor");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
