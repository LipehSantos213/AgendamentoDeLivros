import 'package:flutter/material.dart';

class BuildButtonNavCustom extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const BuildButtonNavCustom({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
        ),
        onPressed: onClick,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
