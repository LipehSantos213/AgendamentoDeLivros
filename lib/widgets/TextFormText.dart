// import 'package:aplication_gp_servers/constants/AppColors.dart';
// import 'package:aplication_gp_servers/views/Cadastro.dart' show valueSenha;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormText extends StatefulWidget {
  final GlobalKey? formkey;
  final TextEditingController? controller;
  final IconData prefixIcon;
  final bool isPassword;
  final String hint;
  final String label;
  final bool number;

  const TextFormText({
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.formkey,
    this.number = false,
    this.isPassword = false,
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscure : false,
        keyboardType: widget.number ? TextInputType.number : null,
        cursorColor: Colors.black,
        inputFormatters:
            widget.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : null, // Bloqueia letras e caracteres especiais

        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
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
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "esse espaço não pode ficar vazio";
          }
          if (value.trim().contains(" ") && widget.label != "Usuario") {
            return "esse campo há espaço";
          }
          if (widget.label == "Usuario") {
            if (value.trim().length > 40) {
              return "nome de usuario muito grande";
            } else if (value.trim().length < 8) {
              return "nome de usuario muito pequeno";
            } else if (RegExp(r'\d').hasMatch(value.substring(0, 7))) {
              return "Os 7 primeiros digitos não pode ter numero";
            }
          }
          if (widget.label == "Email") {
            if (!(value.contains("@gmail.com") ||
                value.contains("@aluno.ce.gov.br") ||
                value.contains("@hotmail.com"))) {
              return "email invalido";
            }
            String nomeUsuario = value.substring(0, value.indexOf("@"));
            if (nomeUsuario.length < 8) {
              return "O nome do email: $nomeUsuario, dever ter mais de 8 carasteres";
            }
            if (RegExp(r'[A-Z]').hasMatch(nomeUsuario)) {
              return "foi achado uma letra maiuscula, corrija";
            }
            if (RegExp(
              r'[áàâãäéèêëíìîïóòôõöúùûüçÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ]',
            ).hasMatch(value)) {
              return "não pode ter acento";
            }
          }

          if (widget.label == "Senha") {
            if (value.trim().length < 7) {
              return "a senha deve haver mais de 6 caracteres";
            }
          }
          // if (widget.label == "Confirmar") {
          //   if (value.trim() != valueSenha) {
          //     return "confirme sua senha novamente";
          //   }
          // }

          return null;
        },
      ),
    );
  }
}
