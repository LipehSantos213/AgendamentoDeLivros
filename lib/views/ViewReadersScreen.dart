import 'package:flutter/material.dart';

class ViewReadersScreen extends StatefulWidget {
  const ViewReadersScreen({super.key});

  @override
  State<ViewReadersScreen> createState() => _ViewReadersScreenState();
}

class _ViewReadersScreenState extends State<ViewReadersScreen> {
  AppBar myAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Align(
        heightFactor: 20,
        widthFactor: 20,
        child: Text(
          "Tela ainda em desenvolvimento !!!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
