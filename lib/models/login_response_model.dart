/* import 'dart:convert';

LoginResponseModel loginResponseModel(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.ciPar,
    required this.nombreComp,
    required this.email,
    required this.nick,
    required this.clave,
    required this.numero,
  });
  late final int ciPar;
  late final String nombreComp;
  late final String email;
  late final String nick;
  late final String clave;
  late final int numero;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    ciPar = json['ci_par'];
    nombreComp = json['nombre_comp'];
    email = json['email'];
    nick = json['nick'];
    clave = json['clave'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ci_par'] = ciPar;
    _data['nombre_comp'] = nombreComp;
    _data['email'] = email;
    _data['nick'] = nick;
    _data['clave'] = clave;
    _data['numero'] = numero;
    return _data;
  }
} */
