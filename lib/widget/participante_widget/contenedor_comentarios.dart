import 'package:flutter/material.dart';

class ContenedorComentarios extends StatefulWidget {
  const ContenedorComentarios({super.key});

  @override
  State<ContenedorComentarios> createState() => _ContenedorComentariosState();
}

class _ContenedorComentariosState extends State<ContenedorComentarios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Evento: Evento X",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Text(
            "Actividad: Actividad Y",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          TextField(
            autofillHints: Characters("a"),
          )
        ],
      ),
    );
  }
}
