import 'package:flutter/material.dart';

class Usuario with ChangeNotifier {
  String _nick = "";
  String _rol = "";
  String _nombre = "";
  String _email = "";

  get resActividad {
    var mapa_even = {
      "nick": _nick,
      "rol": _rol,
      "nombre": _nombre,
      "email": _email
    };

    return mapa_even;
  }

  void reqActividad(String nick, String rol, String nombre, String email) {
    _nick = nick;
    _rol = rol;
    _nombre = nombre;
    _email = email;

    notifyListeners();
  }
}
