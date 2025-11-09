import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaConsultarLivro extends StatefulWidget {
  const TelaConsultarLivro({super.key});

  @override
  State<TelaConsultarLivro> createState() => _TelaConsultarLivroState();
}

class _TelaConsultarLivroState extends State<TelaConsultarLivro> {
  final controllers = {
    "tituloLivro": TextEditingController(),
    "autorLivro": TextEditingController(),
    "editora": TextEditingController(),
    "anoPublicacao": TextEditingController(),
    "isbn": TextEditingController(),
    "quantidade": TextEditingController(),
    "exemplar": TextEditingController(),
    "localizacao": TextEditingController(),
    "status": TextEditingController(),
    "nomeLeitor": TextEditingController(),
    "emailLeitor": TextEditingController(),
    "dataEmprestimo": TextEditingController(),
    "dataDevolucao": TextEditingController(),
    "observacoes": TextEditingController(),
  };

  final formkeys = {
    "tituloLivro": GlobalKey<FormState>(),
    "autorLivro": GlobalKey<FormState>(),
    "editora": GlobalKey<FormState>(),
    "anoPublicacao": GlobalKey<FormState>(),
    "isbn": GlobalKey<FormState>(),
    "quantidade": GlobalKey<FormState>(),
    "exemplar": GlobalKey<FormState>(),
    "localizacao": GlobalKey<FormState>(),
    "status": GlobalKey<FormState>(),
    "nomeLeitor": GlobalKey<FormState>(),
    "emailLeitor": GlobalKey<FormState>(),
    "dataEmprestimo": GlobalKey<FormState>(),
    "dataDevolucao": GlobalKey<FormState>(),
    "observacoes": GlobalKey<FormState>(),
  };

  final List<String> statusOptions = [
    'Disponível',
    'Emprestado',
    'Reservado',
    'Danificado',
  ];
  String statusSelecionado = 'Disponível';

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

  Widget buildButtonRemoverLivro() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade600,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadowColor: Colors.red.withOpacity(0.4),
          elevation: 6,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text("Confirmar remoção"),
                  content: const Text(
                    "Tem certeza que deseja remover este livro da biblioteca?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          for (var controller in controllers.values) {
                            controller.clear();
                          }
                          leitoresAtuais.clear();
                          statusSelecionado = "Disponível";
                        });
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Livro removido com sucesso!"),
                          ),
                        );
                      },
                      child: const Text(
                        "Remover",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
          );
        },
        child: const Text(
          "Remover Livro",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Simulação de lista de leitores
  List<Map<String, String>> leitoresAtuais = [
    {"nome": "João da Silva", "email": "joao@email.com", "exemplar": "01"},
    {"nome": "Maria Souza", "email": "maria@email.com", "exemplar": "02"},
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
      appBar: const AppBarCustom(title: "Consulta de Livro"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildButtonNavCustom(title: "Pedentes", onClick: () {}),
              buildSizedBox(),
              // ------------------ BUSCA DE LIVRO ------------------
              buildCardBuscarLivro(),
              // se ISBN não for digitado, faça uma busca completa, do livro
              buildSizedBox(),

              // ------------------ INFORMAÇÕES DO LIVRO ------------------
              buildCardInforLivro(),
              buildSizedBox(),
              // ------------------ BOTÃO REMOVER LIVRO ------------------
              buildButtonRemoverLivro(),
              buildSizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardInforLivro() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: decorationCardInforLivro(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buidInformacoesDoLivro(),
          buildSizedBox(),
          const Divider(),
          const SizedBox(height: 8),
          buildStatusLeitoresAtualmente(),
        ],
      ),
    );
  }

  Column buidInformacoesDoLivro() {
    return Column(
      children: [
        const Text(
          "Informações do Livro",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        buildSizedBox(),
        buildRowCustom(
          Text(
            "Status:",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            statusSelecionado,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        buildSizedBox(),
        buildRowCustom(
          Text(
            "Quantidade na Biblioteca:",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            controllers["quantidade"]!.text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        buildSizedBox(),
        buildRowCustom(
          Text(
            "Quantidade emprestada:",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            "${leitoresAtuais.length}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Column buildStatusLeitoresAtualmente() {
    return Column(
      children: [
        const Text(
          "Leitores Atualmente",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        buildSizedBox(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: leitoresAtuais.length,
          itemBuilder: (context, index) {
            final leitor = leitoresAtuais[index];
            return ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(leitor["nome"]!),
              subtitle: Text("Email: ${leitor['email']}"),
              trailing: Text("Exemplar: ${leitor['exemplar']}"),
            );
          },
        ),
      ],
    );
  }

  BoxDecoration decorationCardInforLivro() {
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

  Container buildCardBuscarLivro() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: decorationCardBuscarLivro(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Buscar Livro",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          buildSizedBox(),
          buildRowCustom(
            TextFormText(
              controller: controllers["tituloLivro"]!,
              label: "Título",
              hint: "Ex: Dom Casmurro",
              prefixIcon: Icons.book_outlined,
              formkey: formkeys["tituloLivro"]!,
            ),
            TextFormText(
              controller: controllers["autorLivro"]!,
              label: "Autor",
              hint: "Ex: Machado de Assis",
              prefixIcon: Icons.person_2_outlined,
              formkey: formkeys["autorLivro"]!,
            ),
          ),
          buildSizedBox(),
          TextFormText(
            controller: controllers["isbn"]!,
            label: "ISBN",
            hint: "Ex: 978-85-...",
            prefixIcon: Icons.confirmation_num_outlined,
            formkey: formkeys["isbn"]!,
          ),
          buildSizedBox(),
          Center(
            child: BuildButtonNavCustom(
              title: "Pesquisar Livro",
              onClick: () {
                // Simula retorno de busca
                setState(() {
                  controllers["editora"]!.text = "Companhia das Letras";
                  controllers["anoPublicacao"]!.text = "1899";
                  controllers["quantidade"]!.text = "5";
                  controllers["exemplar"]!.text = "02";
                  controllers["localizacao"]!.text = "Estante A - Prateleira 2";
                  statusSelecionado = "Emprestado";
                  controllers["observacoes"]!.text =
                      "Livro com capa levemente danificada";
                });
              },
            ),
          ),
          buildSizedBox(),
        ],
      ),
    );
  }

  BoxDecoration decorationCardBuscarLivro() {
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
