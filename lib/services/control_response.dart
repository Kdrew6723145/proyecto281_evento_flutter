class ControlResponse {
  int? ciControl;
  String? nombreComp;
  String? nick;
  String? clave;

  ControlResponse({this.ciControl, this.nombreComp, this.nick, this.clave});

  ControlResponse.fromJson(Map<String, dynamic> json) {
    ciControl = json['ci_control'];
    nombreComp = json['nombre_comp'];
    nick = json['nick'];
    clave = json['clave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ci_control'] = this.ciControl;
    data['nombre_comp'] = this.nombreComp;
    data['nick'] = this.nick;
    data['clave'] = this.clave;
    return data;
  }
}
