// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExemplaryScreen extends StatefulWidget {
  const AddExemplaryScreen({super.key});

  @override
  State<AddExemplaryScreen> createState() => _AddExemplaryScreenState();
}

class _AddExemplaryScreenState extends State<AddExemplaryScreen> {
  AppBar myAppBar() {
    return AppBar(title: Text("Adicionar Exemplares"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Align(
            heightFactor: 20,
            widthFactor: 20,
            child: Column(
              children: [
                Text(
                  "Tela Ainda Em Desenvolvimento !!!",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
