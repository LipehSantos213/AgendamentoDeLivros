// ignore: file_names

import 'package:flutter/cupertino.dart' show Navigator;
import 'package:flutter/material.dart' show BuildContext, FormState;
import 'package:flutter/widgets.dart' show GlobalKey;

class Funcs {
  verification(
    Map<String, GlobalKey<FormState>> formkeys_,
    String name,
    String password,
    BuildContext context,
  ) async {
    int controler = 0;

    for (var key in formkeys_.values) {
      if (!(key.currentState?.validate() ?? false)) {
        return false;
      } else {
        controler = controler + 1;
      }
    }
    if (controler == formkeys_.length) {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  clickButtonScreenNewBook(
    Map<String, GlobalKey<FormState>> formkeys,
    BuildContext context,
  ) {
    int controller = 0;
    for (var key in formkeys.values) {
      if (!(key.currentState?.validate() ?? false)) {
        return false;
      } else {
        controller = controller + 1;
      }
    }
  }
}
