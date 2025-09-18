import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarCustom({super.key, required this.title});

  Widget buildIconButton(IconData icone, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icone),
      style: IconButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(width: 2.5, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
      leading: buildIconButton(Icons.home, () {
        Navigator.pop(context);
      }),
    );
  }
}
