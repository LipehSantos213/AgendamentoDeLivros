import 'package:flutter/material.dart';

class TelaDeMenuPrincipal extends StatefulWidget {
  const TelaDeMenuPrincipal({super.key});

  @override
  State<TelaDeMenuPrincipal> createState() => _TelaDeMenuPrincipalState();
}

class _TelaDeMenuPrincipalState extends State<TelaDeMenuPrincipal> {
  Widget buildSpacing() => const SizedBox(height: 25);

  /// Função que retorna um botão estilizado moderno do app
  Widget buildMenuButton({
    required String title,
    required VoidCallback onClick,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 18),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [Color(0xFF6A1B9A), Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 18,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6A1B9A), Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "📚 Biblioteca Digital",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonSair() {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade600,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadowColor: Colors.red.withOpacity(0.4),
          elevation: 6,
        ),
        onPressed: () {
          Navigator.popAndPushNamed(context, "/login");
        },
        child: Row(
          children: [
            Icon(Icons.exit_to_app, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            const Text(
              "Sair",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tela finalizada
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Bem-vindo(a) ao sistema de biblioteca!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Escolha a ação que deseja realizar abaixo:",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // ---------- Botões principais ----------
            buildMenuButton(
              title: "Cadastrar Livro",
              onClick: () => Navigator.pushNamed(context, "/addbook"),
            ),
            buildSpacing(),
            buildMenuButton(
              title: "Cadastrar Leitor",
              onClick: () => Navigator.pushNamed(context, "/addreader"),
            ),
            buildSpacing(),
            buildMenuButton(
              title: "Visualizar Biblioteca",
              onClick: () => Navigator.pushNamed(context, "/viewlibrary"),
            ),
            buildSpacing(),
            buildMenuButton(
              title: "Catalogação de Empréstimo",
              onClick: () => Navigator.pushNamed(context, "/catalogarlivro"),
            ),
            buildSpacing(),
            buildMenuButton(
              title: "Consultar Livro",
              onClick: () => Navigator.pushNamed(context, "/consultarlivro"),
            ),
            buildSpacing(),
            buildMenuButton(
              title: "Consultar Leitor",
              onClick: () => Navigator.pushNamed(context, "/consultarleitor"),
            ),
            buildSpacing(),

            // ---------- Butão de Sair ----------
            buildButtonSair(),

            // ---------- Card para novas funcionalidades ----------
            buildCardNovaFuncio(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Container buildCardNovaFuncio() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: const [
          Text(
            "Em breve:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Novas funcionalidades estarão disponíveis aqui, "
            "como relatórios detalhados, gráficos de empréstimos e reservas.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
