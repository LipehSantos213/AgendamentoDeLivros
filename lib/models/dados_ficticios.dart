class DadosFicticios {
  DadosFicticios._();
  static const listaGroupPeople = [
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
  static const listBooks = [
    {
      "titulo": "Harry Potter: E a Pedra de Crack",
      "nome do autor": "Jaquelina Roulla",
      "quantidade na biblioteca": 4,
      "pessoas lendo": [
        {"nome pessoa": "Renato Viana", "numero exemplar": 1, "": ""},
      ],
    },
  ];
}


// Card(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: SizedBox(
//               height: 100,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Imagem
//                   avatarGroup(),
//                   buildSizedBoxWidthCustom(),
//                   Expanded(
//                     flex: 6,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // coluna com os elementos: Nome do Grupo; Descrição; Quantidade de Pessoas
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${map['nome do grupo']}",
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Text(
//                                   "${map['descrição']}",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(Icons.person, size: 25),
//                                 Text(
//                                   "${map['quantidade de pessoas']}",
//                                   style: TextStyle(fontSize: 14.4),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         // coluna com os elemento: Botão Editar; Livros Sendo Lidos e Pedentes
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextButton(
//                               onPressed: () => onPressed(),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.edit, size: 20),

//                                   Text(
//                                     "Editar",
//                                     style: TextStyle(fontSize: 25),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(Icons.book, color: Colors.lightGreen),
//                                 Text("${map["livros sendo lidos"]}"),
//                                 buildSizedBoxWidthCustom(),
//                                 Icon(
//                                   Icons.book,
//                                   color: const Color.fromARGB(
//                                     255,
//                                     228,
//                                     118,
//                                     104,
//                                   ),
//                                 ),
//                                 Text("${map['livros pedentes']}"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );