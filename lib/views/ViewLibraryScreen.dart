import 'package:flutter/material.dart';

class ViewLibraryScreen extends StatefulWidget {
  const ViewLibraryScreen({super.key});

  @override
  State<ViewLibraryScreen> createState() => _ViewLibraryScreenState();
}

class _ViewLibraryScreenState extends State<ViewLibraryScreen> {
  AppBar myAppBar() {
    return AppBar(
      title: Text("Visualizar Os Livros"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Align(
          heightFactor: 20,
          widthFactor: 20,
          child: Text(
            "Tela ainda em deselvolvimento !!!!",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
