import 'package:agenda_de_livros/views/AddExemplaryScreen.dart';
import 'package:agenda_de_livros/views/AddReaderScreen.dart';
import 'package:agenda_de_livros/views/HomeScreen.dart';
import 'package:agenda_de_livros/views/LoginScreen.dart';
import 'package:agenda_de_livros/views/RegisterNewBookScreen.dart';
import 'package:agenda_de_livros/views/RegisterNewGroupScreen.dart';
import 'package:agenda_de_livros/views/ViewLibraryScreen.dart';
import 'package:agenda_de_livros/views/ViewReadersScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = {
      "/login": (context) => LoginScreen(),
      "/home": (context) => HomeScreen(),
      "/registernewbook": (context) => RegisterNewBookScreen(),
      "/registernewgroup": (context) => RegisterNewGroupScreen(),
      "/viewlibrary": (context) => ViewLibraryScreen(),
      "/addreader": (context) => AddReaderScreen(),
      "/viewreaders": (context) => ViewReadersScreen(),
      "/addexemplary": (context) => AddExemplaryScreen(),
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
