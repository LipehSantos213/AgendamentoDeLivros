import 'package:agenda_de_livros/controllers/Funcs.dart';
import 'package:agenda_de_livros/controllers/LoginController.dart';
import 'package:agenda_de_livros/widgets/TextFormText.dart';
import 'package:flutter/material.dart';

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

  bool _valueCreateAccount = false;
  bool _valueAccessAccount = true;
  final controller = LoginController();

  Widget buildSizedBox() => const SizedBox(height: 18);

  Widget buildTitle() {
    return Column(
      children: [
        const SizedBox(height: 30),
        Hero(
          tag: "bookLogo",
          child: Image.asset("assets/images/book.png", width: 120, height: 120),
        ),
        const SizedBox(height: 16),
        const Text(
          "Agenda de Livros",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _valueCreateAccount
              ? "Crie sua conta para começar!"
              : "Bem-vindo de volta!",
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget buildChoiceChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text("Acessar Conta"),
          selected: _valueAccessAccount,
          onSelected: (value) {
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
          selectedColor: Colors.black,
          labelStyle: TextStyle(
            color: _valueAccessAccount ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(width: 10),
        ChoiceChip(
          label: const Text("Criar Conta"),
          selected: _valueCreateAccount,
          onSelected: (value) {
            setState(() {
              _valueCreateAccount = true;
              _valueAccessAccount = false;
              controller.addControllerAndFormkeyInConfirmSenha(
                controllers,
                formkeys,
                _valueCreateAccount,
              );
            });
          },
          selectedColor: Colors.black,
          labelStyle: TextStyle(
            color: _valueCreateAccount ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return GestureDetector(
      onTap: () => Funcs().callValidatorTextForm(formkeys, context, "/home"),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6A1B9A), Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Text(
          "Entrar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }

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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTitle(),
                    const SizedBox(height: 25),

                    // Campos
                    TextFormText(
                      controller: controllers["controllerUser"]!,
                      label: "Usuário",
                      hint: "Digite seu usuário",
                      prefixIcon: Icons.person_outline,
                      formkey: formkeys["user"]!,
                    ),
                    buildSizedBox(),
                    TextFormText(
                      controller: controllers["controllerEmail"]!,
                      label: "Email",
                      hint: "Digite seu email",
                      prefixIcon: Icons.email_outlined,
                      formkey: formkeys["email"]!,
                    ),
                    buildSizedBox(),
                    TextFormText(
                      controller: controllers["controllerPassword"]!,
                      label: "Senha",
                      hint: "Digite sua senha",
                      prefixIcon: Icons.lock_outline,
                      formkey: formkeys["password"]!,
                      isPassword: true,
                    ),
                    if (_valueCreateAccount) ...[
                      buildSizedBox(),
                      TextFormText(
                        controller: controllers["controllerConfirmPassword"]!,
                        label: "Confirmar Senha",
                        hint: "Repita sua senha",
                        prefixIcon: Icons.lock,
                        formkey: formkeys["confirmPassword"]!,
                        isPassword: true,
                      ),
                    ],

                    const SizedBox(height: 25),
                    buildChoiceChips(),
                    const SizedBox(height: 25),
                    buildButton(),
                    const SizedBox(height: 20),

                    if (_valueAccessAccount)
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
