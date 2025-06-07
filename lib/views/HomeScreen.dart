import 'package:agenda_de_livros/controllers/HomeController.dart';
import 'package:agenda_de_livros/widgets/DrawerCustom.dart';
import '../models/dados_ficticios.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildRowFilter() {
    return Row(
      children: [
        Text("Filtrar por:"),
        ShadSelect<String>(
          placeholder: Text("Filtrar"),
          options: [
            Padding(padding: const EdgeInsets.fromLTRB(32, 6, 6, 6)),
            ...filter.entries.map(
              (e) => ShadOption(value: e.key, child: Text(e.value)),
            ),
          ],
          selectedOptionBuilder: (context, value) => Text(filter[value]!),
        ),
      ],
    );
  }

  Widget buildListGroupPeople(BuildContext context, VoidCallback _onPressed) {
    return Column(
      children: List.generate(DadosFicticios.listaGroupPeople.length, (index) {
        var map = DadosFicticios.listaGroupPeople[index];
        return GestureDetector(
          onTap: () {},
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/5d/6f/c3/5d6fc370cb0bf6ea74ac62b42e8e5e72.jpg",
                          scale: 2.3,
                        ),
                      ),
                    ),
                    buildSizedBoxWidthCustom(),
                    Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${map['nome do grupo']}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "${map['descrição']}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person, size: 25),
                                  Text(
                                    "${map['quantidade de pessoas']}",
                                    style: TextStyle(fontSize: 14.4),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShadButton.ghost(
                                onPressed: _onPressed,
                                leading: Icon(Icons.edit),
                                size: ShadButtonSize.regular,
                                child: Text("Editar"),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.book,
                                    color: Colors.lightGreen,
                                  ),
                                  Text("${map["livros sendo lidos"]}"),
                                  buildSizedBoxWidthCustom(),
                                  Icon(
                                    LucideIcons.book,
                                    color: const Color.fromARGB(
                                      255,
                                      228,
                                      118,
                                      104,
                                    ),
                                  ),
                                  Text("${map['livros pedentes']}"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildSizedBoxWidthCustom() => SizedBox(width: 10);

  void onClickButtonEdit(BuildContext context, String nameGroup) {}

  final filter = {"grupo": "Grupo", "pessoas": "Pessoas"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tela Principal",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.3),
        ),
        centerTitle: true,
      ),
      drawer: DrawerCustom(nameUser: "Teste"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRowFilter(),
              buildListGroupPeople(context, HomeController().onClickButtonEdit),
            ],
          ),
        ),
      ),
    );
  }
}
