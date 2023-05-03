import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventos_flutter/providers/dev_eventos.dart';
import 'package:eventos_flutter/providers/dev_usuario.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../providers/dev_actividades.dart';
import '../vistas_participante/vista_certificados.dart';
import '../vistas_participante/vista_principal_partic.dart';

class ExpositorPage extends StatefulWidget {
  const ExpositorPage({super.key});

  @override
  State<ExpositorPage> createState() => _ExpositorPageState();
}

class _ExpositorPageState extends State<ExpositorPage> {
  final screens = [
    const VistaPrincipalPartic(),
    const VistaCertificados(),
  ];

  int _index = 0;
  PageController controller = PageController();

  static String nombreEvento = "Evento X";
  @override
  Widget build(BuildContext context) {
    //final actividadInfo = Provider.of<Actividad>(context);
    //final eventoInfo = Provider.of<Eventos>(context);
    //final usuarioInfo = Provider.of<Usuario>(context);

    return Scaffold(
      backgroundColor: HexColor("#16285A"),
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 56, 102),
        selectedItemColor: const Color.fromARGB(255, 224, 205, 31),
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() {
          _index = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Actividades",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Material",
          ),
        ],
      ),
    );
  }
}
