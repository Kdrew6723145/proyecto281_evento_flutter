import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#16285A"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  child: Image.asset("assets/images/logo_app.png"),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [BoxShadow(blurRadius: 2, color: Colors.white)],
                  ),
                  child: Column(children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          //---------Usuario
                          TextFormField(
                            controller: userController,
                            validator: (value) =>
                                value == "" ? "Escriba un usuarioddd" : null,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: "Nombre de usuario",
                            ),
                          ),

                          const SizedBox(
                            height: 100,
                          ),
                          TextFormField(
                            controller: userController,
                            validator: (value) =>
                                value == "" ? "Escriba un usuario" : null,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: "Nombre de usuario",
                            ),
                          ),

                          //---------Passw
                        ],
                      ),
                    )
                  ]),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
