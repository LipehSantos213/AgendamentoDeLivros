import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:flutter/material.dart';

class TelaConsultarLivro extends StatefulWidget {
  const TelaConsultarLivro({super.key});

  @override
  State<TelaConsultarLivro> createState() => _TelaConsultarLivroState();
}

class _TelaConsultarLivroState extends State<TelaConsultarLivro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Consultar Livro"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: []),
      ),
    );
  }
}
