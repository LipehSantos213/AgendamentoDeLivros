import 'package:agenda_de_livros/AppLifecycleReactor.dart';
import 'package:agenda_de_livros/views/TelaCadastrarLeitor.dart';
import 'package:agenda_de_livros/views/TelaCatalogarLivro.dart';
import 'package:agenda_de_livros/views/TelaConsultarLeitor.dart';
import 'package:agenda_de_livros/views/TelaConsultarLivro.dart';
import 'package:agenda_de_livros/views/TelaDeMenuPrincipal.dart';
import 'package:agenda_de_livros/views/TelaDeLogin.dart';
import 'package:agenda_de_livros/views/TelaCadastrarLivro.dart';
import 'package:agenda_de_livros/views/TelaVerBiblioteca.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppLifecycleReactor(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = {
      "/login": (context) => TelaDeLogin(),
      "/home": (context) => TelaDeMenuPrincipal(),
      "/addbook": (context) => TelaCadastrarLivro(),
      "/viewlibrary": (context) => TelaVerBiblioteca(),
      "/addreader": (context) => TelaCadastrarLeitor(),
      "/catalogarlivro": (context) => TelaCatalogarLivro(),
      "/consultarlivro": (context) => TelaConsultarLivro(),
      "/consultarleitor": (context) => TelaConsultarLeitor(),
    };
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
          error: const Color.fromARGB(255, 255, 33, 18),
          primary: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: routes,
    );
  }
}
