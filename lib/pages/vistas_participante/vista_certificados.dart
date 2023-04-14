import 'dart:convert';

import 'package:eventos_flutter/models/response_certificados_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../widget/login_widget/header.dart';
import '../../widget/participante_widget/certificado_widget.dart';

class VistaCertificados extends StatefulWidget {
  const VistaCertificados({super.key});

  @override
  State<VistaCertificados> createState() => _VistaCertificadosState();
}

class _VistaCertificadosState extends State<VistaCertificados> {
  List<Certificado> certificados = [];

  @override
  void initState() {
    loadCertificados();
    super.initState();
  }

  loadCertificados() async {
    final response = await loadJsonAssets("assets/json/certificados.json");
    final result = ResponseCertificadoModel.fromJson(response);
    certificados.addAll(result.certificado);
    setState(() {});
  }

  Future<dynamic> loadJsonAssets(String path) async {
    final response = await rootBundle.loadString(path);
    return json.decode(response);
  }

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
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 10),
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
                              SizedBox(
                                width: 80,
                              ),
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

                          //ListView()
                          CertificadoLista(certificados: certificados),
                          //const CertificadoLista(),
                        ],
                      ),
                    ),
                    MaterialButton(
                      color: HexColor("#240774"),
                      padding: const EdgeInsets.all(20),
                      onPressed: () => {
                        print("Boton comentario"),
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 140,
                        child: Row(
                          children: const [
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
