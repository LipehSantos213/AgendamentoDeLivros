import 'package:agenda_de_livros/views/HomeScreen.dart';
import 'package:agenda_de_livros/views/LoginScreen.dart';
import 'package:agenda_de_livros/views/PeopleViewingScreen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ShadApp();
    return ShadApp.custom(
      themeMode: ThemeMode.light,
      darkTheme: ShadThemeData(
        textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      appBuilder: (context) {
        return MaterialApp(
          theme: Theme.of(context),

          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
          initialRoute: "/login",
          routes: {
            "/login": (context) => LoginScreen(),
            "/home": (context) => HomeScreen(),
            "/verificationPerson": (context) => PeopleViewingScreen(),
          },
        );
      },
    );
  }
}
