import 'package:eventos_flutter/pages/vistas_participante/vista_certificados.dart';
import 'package:eventos_flutter/pages/vistas_participante/vista_comentarios.dart';
import 'package:eventos_flutter/pages/vistas_participante/vista_principal_partic.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ParticipantePage extends StatefulWidget {
  const ParticipantePage({super.key});

  @override
  State<ParticipantePage> createState() => _ParticipantePageState();
}

class _ParticipantePageState extends State<ParticipantePage> {

  final screens=[
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
        backgroundColor: Color.fromARGB(255, 0, 56, 102),
        selectedItemColor: Color.fromARGB(255, 224, 205, 31),
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        unselectedItemColor: Colors.white,
        onTap: (index)=>setState(() {
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
      )
      
      
      
      
      
      
      
      
      
      /* GNav(
          backgroundColor: Colors.white,
          iconSize: 25,
          tabs: const [         
            GButton(
              icon: Icons.home,
              text: 'Inicio',
            ),
            GButton(
              icon: Icons.task,
              text: 'Certificados',
            ),
            GButton(
              icon: Icons.local_activity,
              text: 'Actividades',
            ),
          ],
          gap: 8,
          activeColor: const Color.fromARGB(255, 255, 255, 255),
          tabBackgroundColor: const Color.fromARGB(255, 23, 78, 122),
          padding: const EdgeInsets.all(14),
          selectedIndex: _index,
          onTabChange: (index) {
            setState(() {
              _index = _index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screens[index]),
              );
            });
          }) */
    );
  }
}
