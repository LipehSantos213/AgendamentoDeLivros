// ignore: file_names

import 'package:flutter/cupertino.dart' show Navigator;
import 'package:flutter/material.dart' show BuildContext, FormState;
import 'package:flutter/widgets.dart' show GlobalKey;

class Funcs {
  callValidatorTextForm(
    Map<String, GlobalKey<FormState>> formkeys_,
    BuildContext context,
    String routeName,
  ) {
    int controler = 0;
    for (var key in formkeys_.values) {
      if (!(key.currentState?.validate() ?? false)) {
        // chama a função validator() do TextFormText
        return false;
      } else {
        controler = controler + 1;
      }
    }
    if (controler == formkeys_.length) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }
}
