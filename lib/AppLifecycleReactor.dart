import 'package:agenda_de_livros/database/DbHelper.dart';
import 'package:flutter/material.dart';

class AppLifecycleReactor extends StatefulWidget {
  final Widget child;
  const AppLifecycleReactor({required this.child});

  @override
  State<AppLifecycleReactor> createState() => _AppLifecycleReactorState();
}

class _AppLifecycleReactorState extends State<AppLifecycleReactor>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) {
      DbHelper.instance.closeDB();
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
