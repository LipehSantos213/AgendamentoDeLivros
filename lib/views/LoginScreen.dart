import 'package:agenda_de_livros/funcs/Funcs.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map<String, TextEditingController> controllers = {
    "controllerUser": TextEditingController(),
    "controllerPassword": TextEditingController(),
  };
  final Map<String, GlobalKey<FormState>> formkeys = {
    "user": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
  };
  final details = [
    (
      title: "Para que server esse sistema???",
      content:
          "A principal função dele é, armazenar, salvar, editar e listar livros, com um Banco de Dados Local",
    ),
    (
      title: "Area do Programador",
      content:
          "Quem esta desenvolvendo essa aplicação é o Felipe Santos, que é um estudante que gosta da area !",
    ),
  ];
  bool _valueCreateAccount = false;
  bool _valueAccessAccount = false;
  @override
  Widget build(BuildContext context) {
    // double tamanhoStatusBar = MediaQuery.of(context).padding.top;
    // double tamanhoAppBar = kToolbarHeight;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),

          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // SizedBox(height: tamanhoAppBar + tamanhoStatusBar ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/book.png",
                      width: 200,
                      height: 185,
                    ),
                    Text(
                      "Ola, Tudo Bem ?",
                      style: ShadTheme.of(
                        context,
                      ).textTheme.h1.copyWith(fontSize: 40),
                    ),
                  ],
                ),
                buildSizedBoxFixedCustom(),
                TextFormText(
                  controller: controllers['controllerUser']!,
                  label: "Usuario",
                  hint: "usuario",
                  prefixIcon: Icons.person,
                  formkey: formkeys['user']!,
                ),
                buildSizedBoxFixedCustom(),
                TextFormText(
                  controller: controllers['controllerPassword']!,
                  label: "Senha",
                  hint: "senha",
                  prefixIcon: Icons.password,
                  formkey: formkeys["password"]!,
                  isPassword: true,
                ),
                buildSizedBoxFixedCustom(),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        leading: Checkbox(
                          value: _valueCreateAccount,
                          onChanged: (value) {
                            setState(() {
                              _valueCreateAccount = true;
                              _valueAccessAccount = false;
                            });
                          },
                        ),

                        title: Text("Criar Conta"),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        leading: Checkbox(
                          value: _valueAccessAccount,
                          onChanged: (bool? value) {
                            setState(() {
                              _valueAccessAccount = true;
                              _valueCreateAccount = false;
                            });
                          },
                        ),
                        title: Text("Acessar Conta"),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxFixedCustom(),
                Column(
                  children: [
                    ShadAccordion<({String title, String content})>.multiple(
                      maintainState: true,
                      children: details.map(
                        (e) => ShadAccordionItem(
                          value: e,
                          title: Text(e.title),
                          child: Text(e.content),
                        ),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxFixedCustom(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Funcs().verification(
                        formkeys,
                        controllers["controllerUser"]!.text.trim(),
                        controllers["controllerPassword"]!.text.trim(),
                        context,
                      );
                    },
                    child: Text("Entrar/Acessar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBoxFixedCustom() => SizedBox(height: 19);
}
