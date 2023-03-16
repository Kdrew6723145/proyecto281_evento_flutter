import 'dart:math';

import 'package:eventos_flutter/widget/participante_widget/contenedor_comentarios.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../widget/login_widget/header.dart';

class VistaComentarios extends StatefulWidget {
  const VistaComentarios({super.key});

  @override
  State<VistaComentarios> createState() => _VistaComentariosState();
}

class _VistaComentariosState extends State<VistaComentarios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#16285A"),
      child: Column(
        children: [
          Header(),
          Text(
            "SECCION DE COMENTARIOS",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            elevation: 5,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                alignment: Alignment.topCenter,
                width: 340,
                height: 500,
                child: Column(
                  children: [
                    Text(
                      "Evento:  Nombre Evento",
                      style: TextStyle(
                        color: HexColor("#240774"),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Actividad:  Nombre Actividad",
                      style: TextStyle(
                        color: HexColor("#240774"),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(100),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 0, 35, 233),
                          width: 1,
                        ),
                      ),
                      child: const TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Escribe aquí tu comentario',
                        ),
                        cursorHeight: 20,
                        clipBehavior: Clip.antiAlias,
                        autofocus: true,
                      ),
                    ),
                    /* MaterialButton(
                      shape: const CircleBorder(),
                      color: Colors.red,
                      padding: const EdgeInsets.all(20),
                      onPressed: () => {
                        print("Boton comentario"),
                      },
                      child: const Icon(
                        Icons.send,
                        size: 20,
                        color: Colors.amber,
                      ),
                    ), */
                    MaterialButton(
                      color: HexColor("#240774"),
                      padding: const EdgeInsets.all(20),
                      onPressed: () => {
                        print("Boton comentario"),
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        child: const Row(
                          children: [
                            Text(
                              "Guardar",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.save,
                              size: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      color: HexColor("#240774"),
                      padding: const EdgeInsets.all(20),
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 18,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Text(
                              "Volver",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          //ContenedorComentarios()
        ],
      ),
    );
  }
}
