import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaCatalogarLivro extends StatefulWidget {
  const TelaCatalogarLivro({super.key});

  @override
  State<TelaCatalogarLivro> createState() => _TelaCatalogarLivroState();
}

class _TelaCatalogarLivroState extends State<TelaCatalogarLivro> {
  // ----- CONTROLLERS -----
  final controllers = {
    "nomeCompleto": TextEditingController(),
    "contato": TextEditingController(),
    "emailLeitor": TextEditingController(),
    "tituloLivro": TextEditingController(),
    "autorLivro": TextEditingController(),
    "editora": TextEditingController(),
    "anoPublicacao": TextEditingController(),
    "isbn": TextEditingController(),
    "exemplar": TextEditingController(),
    "dataEmprestimo": TextEditingController(),
    "dataDevolucao": TextEditingController(),
    "observacoes": TextEditingController(),
  };

  // ----- KEYS -----
  final formkeys = {
    "nomeCompleto": GlobalKey<FormState>(),
    "contato": GlobalKey<FormState>(),
    "emailLeitor": GlobalKey<FormState>(),
    "tituloLivro": GlobalKey<FormState>(),
    "autorLivro": GlobalKey<FormState>(),
    "editora": GlobalKey<FormState>(),
    "anoPublicacao": GlobalKey<FormState>(),
    "isbn": GlobalKey<FormState>(),
    "exemplar": GlobalKey<FormState>(),
    "dataEmprestimo": GlobalKey<FormState>(),
    "dataDevolucao": GlobalKey<FormState>(),
    "observacoes": GlobalKey<FormState>(),
  };

  // ----- STATUS DO LIVRO -----
  final List<String> statusOptions = [
    'Disponível',
    'Emprestado',
    'Reservado',
    'Danificado',
  ];
  String statusSelecionado = 'Emprestado';

  // Helpers de layout
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

  // Helper para campo de data com picker (icone ao lado)
  Widget buildDateField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormText(
            controller: controller,
            label: label,
            hint: hint,
            prefixIcon: Icons.calendar_month_outlined,
            formkey: formKey,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.date_range_outlined),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder:
                    (context, child) => Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Color(0xFF6A1B9A), // roxo principal
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        ),
                      ),
                      child: child!,
                    ),
              );
              if (picked != null) {
                final formatted =
                    '${picked.day.toString().padLeft(2, '0')}/'
                    '${picked.month.toString().padLeft(2, '0')}/'
                    '${picked.year}';
                setState(() => controller.text = formatted);
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // liberar controllers
    for (final c in controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const AppBarCustom(title: "Catalogação de Empréstimo"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildButtonNavCustom(title: "Devolução De Livro", onClick: () {}),
              const SizedBox(height: 22),
              // ----- CARD PRINCIPAL -----
              buildCardComOsCampos(),

              const SizedBox(height: 22),

              // Botão centralizado
              buildButao(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardComOsCampos() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: decorationCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInforLeitor(),

          const SizedBox(height: 18),
          const Divider(),
          const SizedBox(height: 8),

          // Dados do livro
          buildDadosLivro(),
          const SizedBox(height: 12),
          // status dropdown
          buildDropDown(),

          const SizedBox(height: 18),
          const Divider(),
          const SizedBox(height: 8),

          // Dados do empréstimo
          buildDadosEmprestimo(),
        ],
      ),
    );
  }

  Column buildDadosEmprestimo() {
    return Column(
      children: [
        const Text(
          "Dados do Empréstimo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        buildRowCustom(
          buildDateField(
            label: "Data Empréstimo",
            hint: "dd/mm/aaaa",
            controller: controllers["dataEmprestimo"]!,
            formKey: formkeys["dataEmprestimo"]!,
          ),
          buildDateField(
            label: "Data Devolução",
            hint: "dd/mm/aaaa",
            controller: controllers["dataDevolucao"]!,
            formKey: formkeys["dataDevolucao"]!,
          ),
        ),
        const SizedBox(height: 12),
        TextFormText(
          controller: controllers["observacoes"]!,
          label: "Condição / Observações",
          hint: "Ex: capa rasgada, anotações, etc.",
          prefixIcon: Icons.note_alt_outlined,
          formkey: formkeys["observacoes"]!,
          // maxLines: 3,
        ),
      ],
    );
  }

  Row buildDropDown() {
    return Row(
      children: [
        const SizedBox(
          width: 140,
          child: Text(
            "Status:",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<String>(
                value: statusSelecionado,
                isExpanded: true,
                underline: const SizedBox.shrink(),
                items:
                    statusOptions
                        .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => statusSelecionado = v);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildDadosLivro() {
    return Column(
      children: [
        const Text(
          "Dados do Livro",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
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
        const SizedBox(height: 12),
        buildRowCustom(
          TextFormText(
            controller: controllers["editora"]!,
            label: "Editora",
            hint: "Ex: Companhia das Letras",
            prefixIcon: Icons.library_books_outlined,
            formkey: formkeys["editora"]!,
          ),
          TextFormText(
            controller: controllers["anoPublicacao"]!,
            label: "Ano",
            hint: "Ex: 1899",
            prefixIcon: Icons.calendar_today_outlined,
            number: true,
            formkey: formkeys["anoPublicacao"]!,
          ),
        ),
        const SizedBox(height: 12),
        buildRowCustom(
          TextFormText(
            controller: controllers["isbn"]!,
            label: "ISBN",
            hint: "Ex: 978-85-...",
            prefixIcon: Icons.confirmation_num_outlined,
            formkey: formkeys["isbn"]!,
          ),
          TextFormText(
            controller: controllers["exemplar"]!,
            label: "Nº do Exemplar",
            hint: "Ex: 02",
            prefixIcon: Icons.confirmation_number_outlined,
            formkey: formkeys["exemplar"]!,
          ),
        ),
      ],
    );
  }

  Column buildInforLeitor() {
    return Column(
      children: [
        const Text(
          "Informações do Leitor",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        buildRowCustom(
          TextFormText(
            controller: controllers["nomeCompleto"]!,
            label: "Nome Completo",
            hint: "Ex: João da Silva",
            prefixIcon: Icons.person_outline,
            formkey: formkeys["nomeCompleto"]!,
          ),
          TextFormText(
            controller: controllers["contato"]!,
            label: "Contato",
            hint: "(XX) XXXXX-XXXX",
            prefixIcon: Icons.phone_outlined,
            formkey: formkeys["contato"]!,
            number: true,
          ),
        ),
        const SizedBox(height: 12),
        TextFormText(
          controller: controllers["emailLeitor"]!,
          label: "E-mail (opcional)",
          hint: "email@exemplo.com",
          prefixIcon: Icons.email_outlined,
          formkey: formkeys["emailLeitor"]!,
        ),
      ],
    );
  }

  BoxDecoration decorationCard() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black12, width: 1.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  Center buildButao() {
    return Center(
      child: BuildButtonNavCustom(
        title: "Salvar Catalogação",
        onClick: () {
          // valida todos os formkeys (se você usa Funcs().callValidatorTextForm)
          Funcs().callValidatorTextForm(formkeys, context, "/home");
        },
      ),
    );
  }
}
