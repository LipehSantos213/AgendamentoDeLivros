import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DrawerCustom extends StatefulWidget {
  final String nameUser;
  const DrawerCustom({super.key, required this.nameUser});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
      ),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/5d/6f/c3/5d6fc370cb0bf6ea74ac62b42e8e5e72.jpg',
              ),
            ),
            accountName: Text(
              widget.nameUser.toString().trim().split(
                " ",
              )[0], // pega o primeiro nome do Usuario
              style: TextStyle(fontSize: 25),
            ),
            accountEmail: null,
          ),
          ListTile(
            leading: Icon(LucideIcons.bookMarked400, size: 24),
            title: Text(
              "Adicionar Um Novo Livro",
              style: TextStyle(fontSize: 14.4),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/registernewbook");
            },
          ),
          ListTile(
            leading: Icon(Icons.group_sharp, size: 24),
            title: Text(
              "Adicionar Um Novo Grupo",
              style: TextStyle(fontSize: 14.4),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/registernewgroup");
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books_outlined, size: 24),
            title: Text(
              "Visualizar Livros Da Biblioteca",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/viewlibrary");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
              size: 24,
            ),
            title: Text("Sair"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
