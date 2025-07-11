// ignore_for_file: file_names
import 'package:agenda_de_livros/controllers/HomeController.dart';
import 'package:agenda_de_livros/widgets/DrawerCustom.dart';
import '../models/dados_ficticios.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppBar myAppBar() {
    return AppBar(
      // backgroundColor: Colors.transparent,
      title: Text(
        "Tela Principal",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.3),
      ),
      centerTitle: true,
    );
  }

  Widget buildRowFilter() {
    return Row(children: [Text("Filtrar por:"), Text("...")]);
  }

  Widget buildListGroupPeople(BuildContext context, Function onPressed) {
    Widget avatarGroup() {
      return Expanded(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9dJrH0mRauM_gzG-8TIGL2W1z2saFUZp9Rw&s",
            scale: 50,
          ),
        ),
      );
    }

    return Column(
      children: List.generate(DadosFicticios.listaGroupPeople.length, (index) {
        var map = DadosFicticios.listaGroupPeople[index];
        return SizedBox(
          // width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [avatarGroup()],
                ),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${map["nome do grupo"]}"),
                    Text("${map["descrição"]}"),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildSizedBoxWidthCustom() => SizedBox(width: 10);

  void onClickButtonEdit(BuildContext context, String nameGroup) =>
      print("Butão Edit clicado !!");

  final _controller = HomeController();

  final filter = {"grupo": "Grupo", "pessoas": "Pessoas"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: DrawerCustom(nameUser: "Teste"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRowFilter(),
              buildListGroupPeople(
                context,
                () => _controller.onClickButtonEdit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
