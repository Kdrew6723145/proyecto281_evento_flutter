class ExpositorResponse {
  int? ciExp;
  String? nombreComp;
  String? gradoAcademico;
  String? email;
  String? nick;
  String? clave;
  int? celular;

  ExpositorResponse(
      {this.ciExp,
      this.nombreComp,
      this.gradoAcademico,
      this.email,
      this.nick,
      this.clave,
      this.celular});

  ExpositorResponse.fromJson(Map<String, dynamic> json) {
    ciExp = json['ci_exp'];
    nombreComp = json['nombre_comp'];
    gradoAcademico = json['grado_academico'];
    email = json['email'];
    nick = json['nick'];
    clave = json['clave'];
    celular = json['celular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ci_exp'] = this.ciExp;
    data['nombre_comp'] = this.nombreComp;
    data['grado_academico'] = this.gradoAcademico;
    data['email'] = this.email;
    data['nick'] = this.nick;
    data['clave'] = this.clave;
    data['celular'] = this.celular;
    return data;
  }
}
