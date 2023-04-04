import 'package:eventos_flutter/pages/login_test.dart';
import 'package:eventos_flutter/pages/vistas_participante/participante_page.dart';
import 'package:eventos_flutter/pages/vistas_control/control_page.dart';
import 'package:eventos_flutter/pages/vistas_expositor/expositor_page.dart';
import 'package:eventos_flutter/pages/login_screen.dart';
import 'package:eventos_flutter/providers/dev_actividades.dart';
import 'package:eventos_flutter/providers/dev_eventos.dart';
import 'package:eventos_flutter/providers/dev_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Eventos()),
        ChangeNotifierProvider(create: (context) => Actividad()),
        ChangeNotifierProvider(create: (context) => Usuario())
      ],
      child: MaterialApp(
        title: 'Eventos Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          //'/': (context) => const LoginPage(),
          '/': (context) => const LoginTest(),
          '/participanteView': (context) => const ParticipantePage(),
          '/controlView': (context) => const ControlPage(),
          '/ExpositorView': (context) => const ExpositorPage(),
          '/OtroLogin': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
