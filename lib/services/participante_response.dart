class ParticipanteResponse {
  int? ciPar;
  String? nombreComp;
  String? email;
  String? nick;
  String? clave;
  int? numero;

  ParticipanteResponse(
      {this.ciPar,
      this.nombreComp,
      this.email,
      this.nick,
      this.clave,
      this.numero});

  ParticipanteResponse.fromJson(Map<String, dynamic> json) {
    ciPar = json['ci_par'];
    nombreComp = json['nombre_comp'];
    email = json['email'];
    nick = json['nick'];
    clave = json['clave'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ci_par'] = this.ciPar;
    data['nombre_comp'] = this.nombreComp;
    data['email'] = this.email;
    data['nick'] = this.nick;
    data['clave'] = this.clave;
    data['numero'] = this.numero;
    return data;
  }
}
