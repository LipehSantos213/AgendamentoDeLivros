import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatefulWidget {
  VoidCallback onPressed;
  String text;
  ButtonCustom({super.key, required this.onPressed, required this.text});

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () => widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 132, 255, 136),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
