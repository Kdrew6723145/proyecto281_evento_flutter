import 'dart:core';
import 'package:flutter/material.dart';

class Eventos with ChangeNotifier {
  String _nombre = "";
  String _direccion = "";
  String _fecha = "";
  String _hora = "";

  get resEvento {
    var mapa_even = {
      "nombre": _nombre,
      "direccion": _direccion,
      "fecha": _fecha,
      "hora": _hora,
    };

    return mapa_even;
  }

  void reqEvento(String nombre, String direccion, String fecha, String hora) {
    _nombre = nombre;
    _direccion = direccion;
    _fecha = fecha;
    _hora = hora;

    notifyListeners();
  }
}
