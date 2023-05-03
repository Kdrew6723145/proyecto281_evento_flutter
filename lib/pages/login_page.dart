import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventos_flutter/providers/dev_actividades.dart';
import 'package:eventos_flutter/providers/dev_usuario.dart';
import 'package:eventos_flutter/services/control_response.dart';
import 'package:eventos_flutter/services/expositor_response.dart';
import 'package:eventos_flutter/widget/login_widget/header_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../providers/dev_eventos.dart';
import '../services/participante_response.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isApiCallProces = false;
  bool hidePassword = true;
  String mensaje = "";
  dynamic user;
  String ruta = "";
  String nu = "";
  String np = "";

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  //final _user= <String,FormBuilderFieldState>{};
  String? username;
  String? password;

  Future login() async {
    nu = username.toString();
    np = password.toString();
    final resultado = await Dio().post('http://localhost:8000/login/usuario/',
        data: {"nick": nu, "clave": np});

    Map<String, dynamic> resp = jsonDecode(resultado.toString());

    if (resp.isEmpty) {
      mensaje = "No Existe el usuario, intenta de nuevo";
      Fluttertoast.showToast(
          msg: mensaje,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      if (resp.containsValue("participante")) {
        dynamic particUser = resultado.data;
        ParticipanteResponse p = ParticipanteResponse.fromJson(resultado.data);
        ruta = "/participante";
        //Navigator.pushReplacementNamed(context, "/participante");
      } else {
        if (resp.containsValue("control")) {
          dynamic particControl = resultado.data;
          ControlResponse c = ControlResponse.fromJson(resultado.data);
          ruta = "/control";
          // Navigator.pushReplacementNamed(context, "/control");
        } else {
          dynamic particExpo = resultado.data;
          ExpositorResponse e = ExpositorResponse.fromJson(resultado.data);
          ruta = "/expositor";

          //Navigator.pushReplacementNamed(context, "/expositor");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#16285A"),
        body: ProgressHUD(
          inAsyncCall: isApiCallProces,
          key: UniqueKey(),
          opacity: 0.3,
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    final usuarioInfo = Provider.of<Usuario>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderLogin(),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 30, top: 50, right: 0),
              child: Text(
                "INGRESO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context,
                "Nombre de Usuario",
                "Nombre de Usuario",
                (String onval) => {
                      if (onval.isEmpty)
                        {print("El usuario no puede ser vacio")}
                      else
                        {print("El usuario no puede")}
                    },
                (String onsave) => {username = onsave},
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                prefixIcon: const Icon(Icons.person),
                prefixIconPaddingLeft: 15,
                showPrefixIcon: true,
                paddingLeft: 11),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context,
                "password",
                "Contraseña",
                (String onval) => (onval.isEmpty)
                    ? {print("La contraseña no puede estar vacia")}
                    : print("correcta la contraseña"),
                (String onsave) => {password = onsave},
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                prefixIcon: const Icon(Icons.key_rounded),
                prefixIconPaddingLeft: 15,
                obscureText: hidePassword,
                showPrefixIcon: true,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility)),
                paddingLeft: 11),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                        text: "Olvidaste tu contraseña?",
                        style: const TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint(
                                "TapGestureRecognizerOlvidaste la contrasena");
                          }),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
                "Login",
                () => {
                      //usuarioInfo.reqActividad(nick, rol, nombre, email)
                      globalFormKey.currentState,
                      login(),
                      //print("SIUU"),
                      Navigator.pushNamed(context, ruta)
                    },
                btnColor: HexColor("#283B71"),
                borderColor: HexColor("#EBEBF5"),
                txtColor: HexColor("#EBEBF5"),
                borderRadius: 10),
          ),
        ],
      ),
    );
  }
}
