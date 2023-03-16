import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../widget/login_widget/header.dart';

class VistaCertificados extends StatefulWidget {
  const VistaCertificados({super.key});

  @override
  State<VistaCertificados> createState() => _VistaCertificadosState();
}

class _VistaCertificadosState extends State<VistaCertificados> {

  var lista_cert=const [
    Row(children: [Text("Actividad 1"),Text("Evento 1")]),
    Row(children: [Text("Actividad 2"),Text("Evento 1")]),
    Row(children: [Text("Actividad 3"),Text("Evento 1")]),
    Row(children: [Text("Actividad 4"),Text("Evento 2")]),
    Row(children: [Text("Actividad 1"),Text("Evento 3")]),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#16285A"),
      child: Column(
        children: [
          Header(),
          Text(
            "MIS CERTIFICADOS",
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

                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 10
                      ),
                      height: 300,
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 0, 35, 233),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Actividad",
                                style: TextStyle(
                                  color: HexColor("#240774"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 80,),
                              Text(
                                "Evento",
                                style: TextStyle(
                                  color: HexColor("#240774"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          lista_cert[0],
                          lista_cert[1],
                          /*
                          ListView.builder(
                            itemCount: lista_cert.length,
                           scrollDirection: Axis.vertical,
                           itemBuilder: (context, index) {
                              return Container(
                                child: lista_cert[index],
                              );
                           },
                          )
                          */
                        ],
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
                        width: 140,
                        child: const Row(
                          children: [
                            Text(
                              "Descargar Todo",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.download_for_offline_rounded,
                              size: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
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