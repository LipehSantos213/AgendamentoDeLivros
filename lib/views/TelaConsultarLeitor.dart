import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaConsultarLeitor extends StatefulWidget {
  const TelaConsultarLeitor({super.key});

  @override
  State<TelaConsultarLeitor> createState() => _TelaConsultarLeitorState();
}

class _TelaConsultarLeitorState extends State<TelaConsultarLeitor> {
  final controllers = {
    "nomeLeitor": TextEditingController(),
    "emailLeitor": TextEditingController(),
    "telefoneLeitor": TextEditingController(),
    "livroAtual": TextEditingController(),
    "autorLivro": TextEditingController(),
    "exemplar": TextEditingController(),
    "dataEmprestimo": TextEditingController(),
    "dataDevolucao": TextEditingController(),
  };

  final formkeys = {
    "nomeLeitor": GlobalKey<FormState>(),
    "emailLeitor": GlobalKey<FormState>(),
    "telefoneLeitor": GlobalKey<FormState>(),
    "livroAtual": GlobalKey<FormState>(),
    "autorLivro": GlobalKey<FormState>(),
    "exemplar": GlobalKey<FormState>(),
    "dataEmprestimo": GlobalKey<FormState>(),
    "dataDevolucao": GlobalKey<FormState>(),
  };

  Widget buildSizedBox() => const SizedBox(height: 18);

  Widget buildRowCustom(Widget first, Widget second) {
    return Row(
      children: [
        Expanded(child: first),
        const SizedBox(width: 12),
        Expanded(child: second),
      ],
    );
  }

  // Lista simulada de livros emprestados pelo leitor
  List<Map<String, String>> livrosEmprestados = [
    {
      "titulo": "Dom Casmurro",
      "autor": "Machado de Assis",
      "exemplar": "01",
      "dataEmprestimo": "01/10/2025",
      "dataDevolucao": "10/10/2025",
    },
    {
      "titulo": "O Cortiço",
      "autor": "Aluísio Azevedo",
      "exemplar": "02",
      "dataEmprestimo": "05/10/2025",
      "dataDevolucao": "15/10/2025",
    },
  ];

  
  @override
  void dispose() {
    for (final c in controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const AppBarCustom(title: "Consulta de Leitor"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------ BUSCA DE LEITOR ------------------
              buildCardBuscarLeitor(),
              buildSizedBox(),

              // ------------------ INFORMAÇÕES DO LEITOR ------------------
              buildCardInforLeitor(),
              buildSizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardInforLeitor() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: decorationCardInforLeitor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Informações do Leitor",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          buildSizedBox(),
          buildRowCustom(
            Text(
              "Quantidade de livros emprestados:",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              "${livrosEmprestados.length}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          buildSizedBox(),
          const Divider(),
          const SizedBox(height: 8),
          buildStatusLivrosEmprestados(),
        ],
      ),
    );
  }

  Column buildStatusLivrosEmprestados() {
    return Column(
      children: [
        const Text(
          "Livros Atualmente Emprestados",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        buildSizedBox(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: livrosEmprestados.length,
          itemBuilder: (context, index) {
            final livro = livrosEmprestados[index];
            return ListTile(
              leading: const Icon(Icons.book_outlined),
              title: Text(livro["titulo"]!),
              subtitle: Text(
                "Autor: ${livro['autor']}\nData Empréstimo: ${livro['dataEmprestimo']} - Devolução: ${livro['dataDevolucao']}",
              ),
              trailing: Text("Exemplar: ${livro['exemplar']}"),
            );
          },
        ),
      ],
    );
  }

  BoxDecoration decorationCardInforLeitor() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  Container buildCardBuscarLeitor() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: decorationCardBuscarLeitor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Buscar Leitor",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          buildSizedBox(),
          buildRowCustom(
            TextFormText(
              controller: controllers["nomeLeitor"]!,
              label: "Nome",
              hint: "Ex: João da Silva",
              prefixIcon: Icons.person_outline,
              formkey: formkeys["nomeLeitor"]!,
            ),
            TextFormText(
              controller: controllers["emailLeitor"]!,
              label: "E-mail",
              hint: "Ex: joao@email.com",
              prefixIcon: Icons.email_outlined,
              formkey: formkeys["emailLeitor"]!,
            ),
          ),
          buildSizedBox(),
          TextFormText(
            controller: controllers["telefoneLeitor"]!,
            label: "Telefone",
            hint: "(XX) XXXXX-XXXX",
            prefixIcon: Icons.phone_outlined,
            formkey: formkeys["telefoneLeitor"]!,
          ),
          buildSizedBox(),
          Center(
            child: BuildButtonNavCustom(
              title: "Pesquisar Leitor",
              onClick: () {
                // Simulação de preenchimento após busca
                setState(() {
                  // Ex: dados preenchidos automaticamente
                  controllers["livroAtual"]!.text =
                      livrosEmprestados[0]["titulo"]!;
                  controllers["autorLivro"]!.text =
                      livrosEmprestados[0]["autor"]!;
                  controllers["exemplar"]!.text =
                      livrosEmprestados[0]["exemplar"]!;
                  controllers["dataEmprestimo"]!.text =
                      livrosEmprestados[0]["dataEmprestimo"]!;
                  controllers["dataDevolucao"]!.text =
                      livrosEmprestados[0]["dataDevolucao"]!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration decorationCardBuscarLeitor() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
