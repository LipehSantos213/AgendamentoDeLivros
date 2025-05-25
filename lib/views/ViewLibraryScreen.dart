import 'package:flutter/material.dart';

class ViewLibraryScreen extends StatefulWidget {
  const ViewLibraryScreen({super.key});

  @override
  State<ViewLibraryScreen> createState() => _ViewLibraryScreenState();
}

class _ViewLibraryScreenState extends State<ViewLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualização Dos Livros"),
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
        child: Text("Tela ainda em deselvolvimento !!!!"),
      ),
    );
  }
}
