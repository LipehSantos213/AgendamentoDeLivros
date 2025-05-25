import 'package:flutter/material.dart';

class RegisterNewGroupScreen extends StatefulWidget {
  const RegisterNewGroupScreen({super.key});

  @override
  State<RegisterNewGroupScreen> createState() => _RegisterNewGroupScreenState();
}

class _RegisterNewGroupScreenState extends State<RegisterNewGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Um Novo Grupo"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Text("Tela ainda em deselvolvimento !"),
      ),
    );
  }
}
