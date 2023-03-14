import 'package:flutter/material.dart';

class VistaComentarios extends StatefulWidget {
  const VistaComentarios({super.key});

  @override
  State<VistaComentarios> createState() => _VistaComentariosState();
}

class _VistaComentariosState extends State<VistaComentarios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.bottomCenter,
      child: const Text(
        "Comentarios"
      ),
    );
  }
}