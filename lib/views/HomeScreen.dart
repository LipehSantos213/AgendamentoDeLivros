import 'package:agenda_de_livros/widgets/DrawerCustom.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> listaDeGruposDePessoas = [
    // informações vindas do BD.
    {
      "nome do grupo": "Turma 2 Ano D",
      "descrição": "Turma da Escola PIO XII",
      "quantidade de pessoas": 24,
      "livros sendo lidos": 12,
      "livros pedentes": 9,
      "pessoas": [
        {
          "nome": "Renato",
          "quantidade de livros": 2,
          "livros pedentes": 0,
          "livros": ["Nome do livros", "Nome do livros"],
        },
        {
          "nome": "Santos",
          "quantidade de livros": 5,
          "livros pedentes": 4,
          "livros": [
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
          ],
        },
        {
          "nome": "Lucas",
          "quantidade de livros": 5,
          "livros pedentes": 5,
          "livros": [
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
          ],
        },
      ],
    },
    {
      "nome do grupo": "Circulo de Leitura",
      "descrição": "Grupo de leitura",
      "quantidade de pessoas": 30,
      "livros sendo lidos": 30,
      "livros pedentes": 8,
      "pessoas": [
        {
          "nome": "Vitor",
          "quantidade de livros": 2,
          "livros pedentes": 0,
          "livros": ["Nome do livros", "Nome do livros"],
        },
        {
          "nome": "Melissa",
          "quantidade de livros": 5,
          "livros pedentes": 4,
          "livros": [
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
          ],
        },
        {
          "nome": "Rnaldo",
          "quantidade de livros": 5,
          "livros pedentes": 5,
          "livros": [
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
          ],
        },
      ],
    },
    {
      "nome do grupo": "Amigos Da Leitura",
      "descrição": "Amigos q ",
      "quantidade de pessoas": 8,
      "livros sendo lidos": 13,
      "livros pedentes": 2,
      "pessoas": [
        {
          "nome": "Eduardo",
          "quantidade de livros": 2,
          "livros pedentes": 0,
          "livros": ["Nome do livros", "Nome do livros"],
        },
        {
          "nome": "Daylson",
          "quantidade de livros": 5,
          "livros pedentes": 4,
          "livros": [
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
          ],
        },
        {
          "nome": "Orlando",
          "quantidade de livros": 5,
          "livros pedentes": 5,
          "livros": [
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
            "Nome do livros",
          ],
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // double tamanhoStatusBar = MediaQuery.of(context).padding.top;
    // double tamanhoAppBar = kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tela Principal",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.3),
        ),
        centerTitle: true,
      ),
      drawer: DrawerCustom(nameUser: "Teste"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: List.generate(listaDeGruposDePessoas.length, (index) {
            var map = listaDeGruposDePessoas[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/verificationPerson",
                  arguments: map["pessoas"],
                );
              },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        map['nome do grupo'],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        map['descrição'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShadButton.ghost(
                                    onPressed: () {
                                      _onClickButtonEdit(
                                        context,
                                        map["nome do grupo"],
                                      );
                                    },
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
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _onClickAdd,
      //   child: Icon(Icons.add),
      // ),
    );
  }

  SizedBox buildSizedBoxWidthCustom() => SizedBox(width: 10);
  void _onClickButtonEdit(BuildContext context, String nameGroup) {}
}
