import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../widget/login_widget/header.dart';
import '../vistas_participante/vista_certificados.dart';
import '../vistas_participante/vista_principal_partic.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final screens = [
    const VistaPrincipalPartic(),
    const VistaCertificados(),
  ];

  int _index = 0;
  PageController controller = PageController();

  static String nombreEvento = "Evento X";
  @override
  Widget build(BuildContext context) {
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
            label: "Certificados",
          ),
        ],
      ),
    );
  }
}
