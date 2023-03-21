import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventos_flutter/widget/login_widget/header_login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../services/participante_response.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({super.key});

  @override
  State<LoginTest> createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProces = false;
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  String mensaje = "";
  dynamic user;
  String ruta = "";
  String nc = "";

  Future login() async {
    nc = controllerUser.text;
    final resultado = await Dio().post(
        'https://eventosjwtbackend-production.up.railway.app/login/usuario/',
        data: {"nick": controllerUser.text, "clave": controllerPassword.text});

    Fluttertoast.showToast(
        msg: nc,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    resultado;

    Map<String, dynamic> resp = jsonDecode(resultado.toString());

    if (resp.isEmpty) {
      mensaje = "No Existe le usuario";
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
        Fluttertoast.showToast(
            msg: "Partic",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacementNamed(context, "/participanteView");
      } else {
        if (resp.containsValue("control")) {
          dynamic particControl = resultado.data;
          ParticipanteResponse c =
              ParticipanteResponse.fromJson(resultado.data);
          Fluttertoast.showToast(
              msg: "Control",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushReplacementNamed(context, "/controlView");
        } else {
          dynamic particExpo = resultado.data;
          ParticipanteResponse e =
              ParticipanteResponse.fromJson(resultado.data);
          Fluttertoast.showToast(
              msg: "Expositor",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);

          Navigator.pushReplacementNamed(context, "/expositorView");
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
    ));
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderLogin(),
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
              child: TextField(  
                style: const TextStyle(
                  color: Colors.white
                ),
                cursorColor: Colors.white60,     
                controller: controllerUser,
                decoration: InputDecoration(
                  hoverColor: Colors.white,
                  focusColor: Colors.amber,
                  suffixIconColor: Colors.red,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))                                  
                  ),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,              
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: ()=> {controllerUser.clear()},
                  ),
                  hintText: "Ej. juan123",
                  labelText: "Nombre de Usuario",
                  labelStyle: TextStyle(
                    color: Colors.white60.withOpacity(0.7)
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.2)
                  )
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(  
                style: TextStyle(
                  color: Colors.white
                ),                
                obscureText: hidePassword,
                cursorColor: Colors.white60,     
                controller: controllerPassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  ),
                  suffixIconColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  prefixIcon: Icon(Icons.vpn_key),
                  prefixIconColor: Colors.white,     
                  labelStyle: TextStyle(
                    color: Colors.white60.withOpacity(0.7)
                  ),         
                  suffixIcon: IconButton(
                    icon: Icon(hidePassword?Icons.visibility_off:Icons.visibility),
                    onPressed: ()=> {
                      setState(() {
                        hidePassword = !hidePassword;
                      })
                    },
                  ),
                  hintText: "Ej. 123drdwa",
                  labelText: "Contraseña",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.2)
                  ),                  
                ),
              )),
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
                            debugPrint("Olvidaste la contrasena");
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.white,
                  textStyle: TextStyle(), backgroundColor: HexColor("#283B71")),
              onPressed: () {
                login();
              },
              child: const Text("INGRESAR"),
            ),
          ),
        ],
      ),
    );
  }
}
