import 'package:flutter/material.dart';

class Usuario with ChangeNotifier{
  String _nick = "";
  String _rol = "";
  String _nombre = "";
  String _email = "";

  get resActividad {
    var mapaAct = {
      "nick": _nick,
      "rol": _rol,
      "nombre": _nombre,
      "email": _email
    };

    return mapaAct;
  }

  void reqActividad(String nick, String rol, String nombre, String email) {
    _nick = nick;
    _rol = rol;
    _nombre = nombre;
    _email = email;

    notifyListeners();
  }
}
