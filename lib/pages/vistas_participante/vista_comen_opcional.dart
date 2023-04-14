import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../widget/login_widget/header.dart';

class VistaComentario extends StatefulWidget {
  const VistaComentario({super.key});

  @override
  State<VistaComentario> createState() => _VistaComentarioState();
}

class _VistaComentarioState extends State<VistaComentario> {
  List<String> comments = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#16285A"),
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index]),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe un comentario...',
                    ),
                    onSubmitted: (String text) {
                      setState(() {
                        comments.add(text);
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Agregar el comentario al arreglo de comentarios
                    setState(() {
                      comments.add('Ejemplo de comentario');
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
