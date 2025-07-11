// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class BookController {
  BookController.privateConstrutor();
  static final instance = BookController.privateConstrutor();
  String? validatorQuantifyBook(String value) {
    int? quantify = int.tryParse(value);
    double? doubleQuantify = double.tryParse(value);
    if (doubleQuantify != null) {
      return "a quantidade não pode ter casa decimal !";
    }
    if (quantify == null) {
      return "a quantidade deve ser inteiro !";
    }
    return null;
  }

  Future<String?> validatorUrl(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      final contentType = response.headers['content-type'] ?? '';
      final isValid = contentType.startsWith("image/");
      if (!isValid) {
        return "url não é uma imagem";
      }
    } catch (e) {
      return "url não encontrada";
    }
    return null;
  }
}
