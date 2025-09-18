import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:flutter/material.dart';

class TelaVerBiblioteca extends StatefulWidget {
  const TelaVerBiblioteca({super.key});

  @override
  State<TelaVerBiblioteca> createState() => _TelaVerBibliotecaState();
}

class _TelaVerBibliotecaState extends State<TelaVerBiblioteca> {
  final List<Map<String, String>> books = const [
    {
      'Título': 'Harry Potter',
      'Gênero': 'Aventura',
      'Autor': 'Jakeline Rouller',
      'Editora': 'Saraiva',
      'Quantidade': '7',
    },
    {
      'Título': 'Teddy',
      'Gênero': 'Comédia',
      'Autor': 'Diamal',
      'Editora': 'DDS',
      'Quantidade': '3',
    },
    {
      'Título': 'Smiliguido',
      'Gênero': 'Doido',
      'Autor': 'Jakeline Rouller',
      'Editora': 'Saraiva',
      'Quantidade': '2',
    },
    {
      'Título': 'Potter Harry',
      'Gênero': 'Des-Aventura',
      'Autor': 'Roullleee Jakedoida',
      'Editora': 'Raivasava',
      'Quantidade': 'N/A',
    },
  ];

  Widget buildBookCard(Map<String, String> book, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            book.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        "${entry.key}:",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Visualizar Biblioteca"),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        itemBuilder: (context, index) => buildBookCard(books[index], context),
      ),
    );
  }
}
