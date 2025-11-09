import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/AppBarCustom.dart';
import 'package:agenda_de_livros/widgets/BuildButtonNavCustom.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

class TelaCadastrarLeitor extends StatefulWidget {
  const TelaCadastrarLeitor({super.key});

  @override
  State<TelaCadastrarLeitor> createState() => _TelaCadastrarLeitorState();
}

class _TelaCadastrarLeitorState extends State<TelaCadastrarLeitor> {
  final controllers = {
    "nome": TextEditingController(),
    "sobrenome": TextEditingController(),
    "telefone": TextEditingController(),
    "email": TextEditingController(),
    "rua": TextEditingController(),
    "bairro": TextEditingController(),
    "cep": TextEditingController(),
    "cidade": TextEditingController(),
    "dataNascimento": TextEditingController(),
  };

  final formkeys = {
    "nome": GlobalKey<FormState>(),
    "sobrenome": GlobalKey<FormState>(),
    "telefone": GlobalKey<FormState>(),
    "email": GlobalKey<FormState>(),
    "rua": GlobalKey<FormState>(),
    "bairro": GlobalKey<FormState>(),
    "cep": GlobalKey<FormState>(),
    "cidade": GlobalKey<FormState>(),
    "dataNascimento": GlobalKey<FormState>(),
  };

  Widget buildSizedBox() => const SizedBox(height: 20);

  Widget buildRowCustom(Widget firstElement, Widget secundElement) {
    return Row(
      children: [
        Expanded(child: firstElement),
        const SizedBox(width: 10),
        Expanded(child: secundElement),
      ],
    );
  }

  Widget textCustom(String data) => Text(
    data,
    style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
  );

  Column buildButaoSalvar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildButtonNavCustom(
              title: "Salvar",
              onClick: () {
                Funcs().callValidatorTextForm(formkeys, context, "/home");
              },
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column buildDataNascimento() {
    return Column(
      children: [
        textCustom("Data de Nascimento"),
        const SizedBox(height: 10),
        buildDateField(
          label: "Data de Nascimento",
          hint: "dd/mm/aaaa",
          controller: controllers["dataNascimento"]!,
          formKey: formkeys["dataNascimento"]!,
        ),
        buildSizedBox(),
      ],
    );
  }

  Column buildEndereco() {
    return Column(
      children: [
        textCustom("Endereço"),
        const SizedBox(height: 10),
        TextFormText(
          controller: controllers["rua"]!,
          label: "Rua",
          hint: "Rua Principal, nº 123",
          prefixIcon: Icons.location_on_rounded,
          formkey: formkeys["rua"]!,
        ),
        buildSizedBox(),
        buildRowCustom(
          TextFormText(
            controller: controllers["bairro"]!,
            label: "Bairro",
            hint: "bairro",
            prefixIcon: Icons.maps_home_work,
            formkey: formkeys["bairro"]!,
          ),
          TextFormText(
            controller: controllers["cidade"]!,
            label: "Cidade",
            hint: "cidade",
            prefixIcon: Icons.location_city,
            formkey: formkeys["cidade"]!,
          ),
        ),
        buildSizedBox(),
        TextFormText(
          controller: controllers["cep"]!,
          label: "CEP",
          hint: "00000-000",
          prefixIcon: Icons.numbers,
          formkey: formkeys["cep"]!,
          number: true,
        ),
        buildSizedBox(),
      ],
    );
  }

  Column buildContatoPessoais() {
    return Column(
      children: [
        textCustom("Contato"),
        const SizedBox(height: 10),
        buildRowCustom(
          TextFormText(
            controller: controllers["telefone"]!,
            label: "Telefone",
            hint: "telefone",
            prefixIcon: Icons.phone_android,
            formkey: formkeys["telefone"]!,
            number: true,
          ),
          TextFormText(
            controller: controllers["email"]!,
            label: "E-mail",
            hint: "exemplo@email.com",
            prefixIcon: Icons.email_outlined,
            formkey: formkeys["email"]!,
          ),
        ),
        buildSizedBox(),
      ],
    );
  }

  Column buildDadosPessoais() {
    return Column(
      children: [
        textCustom("Dados Pessoais"),
        const SizedBox(height: 10),
        buildRowCustom(
          TextFormText(
            controller: controllers["nome"]!,
            label: "Nome",
            hint: "nome",
            prefixIcon: Icons.person,
            formkey: formkeys["nome"]!,
          ),
          TextFormText(
            controller: controllers["sobrenome"]!,
            label: "Sobrenome",
            hint: "sobrenome",
            prefixIcon: Icons.person_outline,
            formkey: formkeys["sobrenome"]!,
          ),
        ),
        buildSizedBox(),
      ],
    );
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Cadastrar Leitor"),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // --- DADOS PESSOAIS ---
              buildDadosPessoais(),

              // --- CONTATO ---
              buildContatoPessoais(),

              // --- ENDEREÇO ---
              buildEndereco(),

              // --- DATA DE NASCIMENTO ---
              buildDataNascimento(),

              // --- BOTÃO SALVAR ---
              buildButaoSalvar(),
            ],
          ),
        ),
      ),
    );
  }
}
