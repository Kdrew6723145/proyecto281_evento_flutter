import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class MaterialCompleto extends StatefulWidget {
  const MaterialCompleto({super.key});

  @override
  State<MaterialCompleto> createState() => _MaterialCompletoState();
}

class _MaterialCompletoState extends State<MaterialCompleto> {
  _cargararchivo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      var url = 'http://192.168.51.1/upload';
      var postUri = Uri.parse(url);
      var request = http.MultipartRequest('POST', postUri);
      request.files
          .add(await http.MultipartFile.fromPath("file", file.path.toString()));
      var res = await request.send().then((response) {
        http.Response.fromStream(response).then((onValue) {
          print(response.statusCode);
        });
      });
      print(res.reasonPharse);
      return res.reasonPhrase;
    } else {
      // Usuario cancela carga
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descargar Material"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("Aqui Subes tu archivo"),
          ElevatedButton(
            onPressed: () {
              _cargararchivo();
            },
            child: Text("Cargar Archivo"),
          )
        ],
      )),
    );
  }
}
