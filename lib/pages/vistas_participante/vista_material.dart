import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class VistaMaterialDescarga extends StatefulWidget {
  const VistaMaterialDescarga({super.key});

  @override
  State<VistaMaterialDescarga> createState() => _VistaMaterialDescargaState();
}

class _VistaMaterialDescargaState extends State<VistaMaterialDescarga> {
  List<String> fileNames = [];

  @override
  void initState() {
    super.initState();
    fetchFileNames();
  }

  Future<void> fetchFileNames() async {
    final url = 'http://192.168.0.16:8000/info';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<String> names = List<String>.from(jsonData['files']);
      setState(() {
        fileNames = names;
      });
    } else {
      throw Exception(
          'Error al obtener los nombres de los archivos: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de archivos'),
      ),
      body: ListView.builder(
        itemCount: fileNames.length,
        itemBuilder: (context, index) {
          final fileName = fileNames[index];
          return ElevatedButton(
            onPressed: () {
              // Realizar alguna acción cuando se presione el botón
              // Por ejemplo, descargar el archivo
              downloadFile(fileName);
            },
            child: Text(fileName),
          );
        },
      ),
    );
  }

  void downloadFile(String fileName) {
    // Implementar la lógica para descargar el archivo aquí
    print('Descargando archivo: $fileName');
  }
}
