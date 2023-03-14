import 'package:eventos_flutter/pages/login_page.dart';
import 'package:eventos_flutter/pages/vistas_participante/participante_page.dart';
import 'package:eventos_flutter/pages/vistas_control/control_page.dart';
import 'package:eventos_flutter/pages/vistas_expositor/expositor_page.dart';
import 'package:eventos_flutter/pages/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/participanteView': (context) => const ParticipantePage(),
        '/controlView': (context) => const ControlPage(),
        '/ExpositorView': (context) => const ExpositorPage(),
        '/OtroLogin': (context) => const LoginScreen(),
      },
    );
  }
}
