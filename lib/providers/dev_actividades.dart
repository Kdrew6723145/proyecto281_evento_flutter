import 'package:flutter/material.dart';

class Actividad with ChangeNotifier {
  String _nombre = "";
  String _hora = "";
  String _fecha = "";

  get resActividad {
    var mapa_even = {
      "nombre": _nombre,
      "fecha": _fecha,
      "hora": _hora,
    };

    return mapa_even;
  }

  void reqActividad(String nombre, String fecha, String hora) {
    _nombre = nombre;
    _fecha = fecha;
    _hora = hora;

    notifyListeners();
  }
}
