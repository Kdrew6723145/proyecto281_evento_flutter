import 'package:eventos_flutter/models/response_certificados_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class CertificadoLista extends StatelessWidget {
  const CertificadoLista({
    Key? key,
    required this.certificados,
  }) : super(key: key);

  final List<Certificado> certificados;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "BigData",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const Text(
            "Machine Learning",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.red),
                shadowColor: Colors.white,
                backgroundColor: HexColor("#283B71"),
                minimumSize: Size(10, 30)),
            onPressed: () {
              //Navigator.pop(context);
              Fluttertoast.showToast(
                  msg: "Certificado Descargado",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: Icon(Icons.download, size: 20),
          ),
        ],
      ),
    );
  }
}
