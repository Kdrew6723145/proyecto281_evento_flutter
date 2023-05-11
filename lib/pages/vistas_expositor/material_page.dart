import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

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
    Future _cargar() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      try {
        if (result != null) {
          PlatformFile file = result.files.first;

          print(file.name);
          print(file.bytes);
          print(file.size);
          print(file.extension);
          print(file.path);
          var url = 'http://192.168.0.16:8000/upload';
          var postUri = Uri.parse(url);
          var request = http.MultipartRequest('POST', postUri);
          request.files.add(
              await http.MultipartFile.fromPath("file", file.path.toString()));
          var res = await request.send().then((response) {
            http.Response.fromStream(response).then((onValue) {
              print(response.statusCode);
            });
          });
          return res.reasonPhrase;
        } else {
          // Usuario cancela carga
        }
      } catch (Exception) {
        Exception.toString();
      }
    }

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
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  _cargar();
                  Fluttertoast.showToast(
                      msg: "Archivo Subido Correctamente",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text("Seleccionar Archivo"),
              ),
            ],
          )),
    );
  }
}
