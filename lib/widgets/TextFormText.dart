// ignore_for_file: file_names

import 'package:agenda_de_livros/controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

class TextFormText extends StatefulWidget {
  final GlobalKey? formkey;
  final TextEditingController? controller;
  final IconData prefixIcon;
  final bool isPassword;
  final String hint;
  final String label;
  final bool number;
  // final bool isDate;

  const TextFormText({
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.formkey,
    this.number = false,
    this.isPassword = false,
    // this.isDate = false,
    super.key,
  });

  @override
  State<TextFormText> createState() => _TextFormTextState();
}

class _TextFormTextState extends State<TextFormText> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  // Future<void> selecionarData(BuildContext context) async {
  //   final DateTime? dataEscolhida = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime(2000, 1, 1),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //     helpText: "Selecione uma data",
  //     locale: const Locale("pt", "BR"),
  //   );
  //   if (dataEscolhida != null) {
  //     String dataFormatada = DateFormat("dd/MM/yyyy").format(dataEscolhida);
  //     widget.controller?.text = dataFormatada;
  //   }
  // }

  InputDecoration _decorationInput() {
    return InputDecoration(
      labelText: widget.label,
      hintText: widget.hint,
      hintStyle: TextStyle(color: Colors.grey[500]),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      floatingLabelBehavior: FloatingLabelBehavior.always,

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(width: 2.45, color: Colors.black),
      ),

      prefixIcon: Icon(widget.prefixIcon, size: 22),
      suffixIcon:
          widget.isPassword
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              )
              : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscure : false,
        keyboardType: widget.number ? TextInputType.number : TextInputType.text,
        cursorColor: Colors.black,
        inputFormatters:
            widget.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : null, // Bloqueia letras e caracteres especiais

        decoration: _decorationInput(),
        validator: (value) {
          final _controlLogin = LoginController();
          if (value == null || value.isEmpty) {
            return "esse espaço não pode ficar vazio";
          }
          if (widget.label == "Usuario") {
            return _controlLogin.validationUserName(value.trim());
          }
          if (widget.label == "Senha") {
            return _controlLogin.validationPassword(value.trim());
          }
          if (widget.label == "Email") {
            return _controlLogin.validationEmail(value.trim());
          }

          return null;
        },
      ),
    );
  }
}
