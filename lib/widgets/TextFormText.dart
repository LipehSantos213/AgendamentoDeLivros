// ignore_for_file: file_names

import 'package:agenda_de_livros/controllers/LoginController.dart';
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
        keyboardType: widget.number ? TextInputType.number : null,
        cursorColor: Colors.black,
        inputFormatters:
            widget.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : null, // Bloqueia letras e caracteres especiais

        decoration: _decorationInput(),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "esse espaço não pode ficar vazio";
          }
          if (widget.label == "Usuario") {
            LoginController().validationUserName(value.trim());
          }
          if (widget.label == "Senha") {
            LoginController().validationPassword(value.trim());
          }

          return null;
        },
      ),
    );
  }
}
