import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
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

  Widget buildCardLivro(Map<String, String> book) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFF4F4F4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.black12, width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              book.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          "${entry.key}:",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: const AppBarCustom(title: "Visualizar Biblioteca"),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "📚 Livros Na Biblioteca",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            BuildButtonNavCustom(title: "Livros Emprestados", onClick: () {}), 
            // faça uma logica para pegar os livros emprestados e colocar na lista "books"
            const Divider(thickness: 1.2, color: Colors.black54),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: books.length,
                itemBuilder: (context, index) => buildCardLivro(books[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
