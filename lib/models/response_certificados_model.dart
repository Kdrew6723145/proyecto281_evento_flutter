class ResponseCertificadoModel {
  ResponseCertificadoModel({
    required this.certificado,
  });

  List<Certificado> certificado;

  factory ResponseCertificadoModel.fromJson(Map<String, dynamic> json) =>
      ResponseCertificadoModel(
        certificado: List<Certificado>.from(
            json["certificados"].map((x) => Certificado.fromJson(x))),
      );
}

class Certificado {
  Certificado({
    required this.id,
    required this.evento,
    required this.actividad,
  });

  int id;
  String evento;
  String actividad;

  factory Certificado.fromJson(Map<String, dynamic> json) => Certificado(
        id: json["id"],
        evento: json["evento"],
        actividad: json["actividad"],
      );
}
