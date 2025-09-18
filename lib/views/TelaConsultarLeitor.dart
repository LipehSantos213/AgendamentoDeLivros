import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:flutter/material.dart';

class TelaConsultarLeitor extends StatefulWidget {
  const TelaConsultarLeitor({super.key});

  @override
  State<TelaConsultarLeitor> createState() => _TelaConsultarLeitorState();
}

class _TelaConsultarLeitorState extends State<TelaConsultarLeitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Consultar Leitor"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: []),
      ),
    );
  }
}
