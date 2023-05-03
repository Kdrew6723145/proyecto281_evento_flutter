import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../services/selected_file.dart';

class WidgetExpositor extends StatefulWidget {
  const WidgetExpositor({super.key});

  @override
  State<WidgetExpositor> createState() => _WidgetExpositorState();
}

class _WidgetExpositorState extends State<WidgetExpositor> {
  File? imagen_to_subir;

  @override
  Widget build(BuildContext context) {
    return Material(
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
                "Evento:  TICS en la Sociedad",
                style: TextStyle(
                  color: HexColor("#240774"),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Actividad:  Celular, Dependencia",
                style: TextStyle(
                  color: HexColor("#240774"),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Column(
                children: [
                  imagen_to_subir != null
                      ? Image.file(imagen_to_subir!)
                      : Container(
                          color: Colors.red,
                          width: double.infinity,
                          height: 200,
                        ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () async {
                  final image = await getImage();
                  setState(() {
                    imagen_to_subir = File(image!.path);
                  });
                },
                child: const Text("Seleccionar Imagen"),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text("Subir Imagen"),
              ),
            ],
          )),
    );
  }
}
