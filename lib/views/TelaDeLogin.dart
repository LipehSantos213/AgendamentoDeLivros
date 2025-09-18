import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/controllers/LoginController.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({super.key});

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  final controllers = {
    "controllerUser": TextEditingController(),
    "controllerEmail": TextEditingController(),
    "controllerPassword": TextEditingController(),
  };

  final formkeys = {
    "user": GlobalKey<FormState>(),
    "email": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
  };

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
                  controller.addControllerAndFormkeyInConfirmSenha(
                    controllers,
                    formkeys,
                    _valueCreateAccount, // criando uma conta !!!
                  );
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
                  controller.addControllerAndFormkeyInConfirmSenha(
                    controllers,
                    formkeys,
                    _valueCreateAccount,
                  );
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
          "Criar/Acessar",
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

  bool _valueAccessAccount = true;

  final controller = LoginController();
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
                // Campo: Usuario
                TextFormText(
                  controller: controllers['controllerUser']!,
                  label: "Usuario",
                  hint: "usuario",
                  prefixIcon: Icons.person,
                  formkey: formkeys['user']!,
                ),

                buildSizedBoxFixedCustom(),
                // Campo: Email
                TextFormText(
                  controller: controllers["controllerEmail"],
                  label: "Email",
                  hint: "Email",
                  prefixIcon: Icons.email,
                  formkey: formkeys["email"],
                ),
                buildSizedBoxFixedCustom(),
                // Campo: Senha
                TextFormText(
                  controller: controllers['controllerPassword']!,
                  label: "Senha",
                  hint: "senha",
                  prefixIcon: Icons.password,
                  formkey: formkeys["password"]!,
                  isPassword: true,
                ),

                // Campo: Confirma Senha
                if (!_valueAccessAccount) ...[
                  buildSizedBoxFixedCustom(),
                  TextFormText(
                    controller: controllers["controllerConfirmPassword"],
                    label: "Confirma Senha",
                    hint: "confirma senha",
                    prefixIcon: Icons.password,
                    formkey: formkeys["confirmPassword"],
                    // isPassword: true,
                  ),
                ],

                buildSizedBoxFixedCustom(),

                buildRowCheckBox(),

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
