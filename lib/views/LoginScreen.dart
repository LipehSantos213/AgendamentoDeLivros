import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllers = {
    "controllerUser": TextEditingController(),
    "controllerPassword": TextEditingController(),
  };

  final formkeys = {
    "user": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
  };

  // final details = [
  //   (
  //     title: "Para que server esse sistema???",
  //     content:
  //         "A principal função dele é, armazenar, salvar, editar e listar livros, com um Banco de Dados Local",
  //   ),
  //   (
  //     title: "Area do Programador",
  //     content:
  //         "Quem esta desenvolvendo essa aplicação é o Felipe Santos, que é um estudante que gosta da area !",
  //   ),
  // ];

  Widget buildRowCheckBox() {
    return Row(
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
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          Funcs().callValidatorTextForm(formkeys, context, "/home");
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
        child: Text(
          "Entrar/Acessar",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget buildSizedBoxFixedCustom() => SizedBox(height: 19);

  Widget buildTitleMyApp() {
    return Column(
      children: [
        Image.asset("assets/images/book.png", width: 200, height: 185),
        Text(
          "Ola, Tudo Bem ?",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }

  bool _valueCreateAccount = false;

  bool _valueAccessAccount = false;
  @override
  Widget build(BuildContext context) {
    // TELA FINALIZADA !!!
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildTitleMyApp(),

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

                if (_valueCreateAccount) ...[
                  buildSizedBoxFixedCustom(),
                  TextFormText(
                    controller: controllers["controllerConfirmPassword"],
                    label: "Confirma Senha",
                    hint: "confirma senha",
                    prefixIcon: Icons.password,
                    formkey: formkeys["formkeyConfirmPassword"],
                    isPassword: true,
                  ),
                ],

                buildSizedBoxFixedCustom(),

                buildRowCheckBox(),

                buildSizedBoxFixedCustom(),

                buildSizedBoxFixedCustom(),

                buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
