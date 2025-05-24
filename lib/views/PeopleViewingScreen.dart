import 'package:flutter/material.dart';

class PeopleViewingScreen extends StatefulWidget {
  const PeopleViewingScreen({super.key});

  @override
  State<PeopleViewingScreen> createState() => _PeopleViewingScreenState();
}

class _PeopleViewingScreenState extends State<PeopleViewingScreen> {
  @override
  Widget build(BuildContext context) {
    final dadosRecebidos =
        ModalRoute.of(context)!.settings.arguments as List<Map<String, Object>>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Visualização de Pessoas"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: List.generate(dadosRecebidos.length, (index) {
            var map = dadosRecebidos[index];
            return ListTile(
              title: Text("${map['nome']}"),
              subtitle: Text(
                "Estão sendo lidos ${map["quantidade de livros"]} livros",
              ),
            );
          }),
        ),
      ),
    );
  }
}
