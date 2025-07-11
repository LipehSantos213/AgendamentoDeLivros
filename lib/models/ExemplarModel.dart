class ExemplarModel {
  int? id;
  final String codigo;
  final String tituloLivro;

  ExemplarModel({this.id, required this.codigo, required this.tituloLivro});
  Map<String, dynamic> toMap() {
    return {"id": id, "codigo": codigo, "tituloLivro": tituloLivro};
  }

  factory ExemplarModel.fromJson(Map<String, dynamic> map) {
    return ExemplarModel(
      id: map["id"],
      codigo: map["codigo"],
      tituloLivro: map["tituloLivro"],
    );
  }
}
