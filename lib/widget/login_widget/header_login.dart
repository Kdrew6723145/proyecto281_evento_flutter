import 'package:flutter/material.dart';
class HeaderLogin extends StatefulWidget {
  const HeaderLogin({super.key});

  @override
  State<HeaderLogin> createState() => _HeaderLoginState();
}

class _HeaderLoginState extends State<HeaderLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logo_app.png",
                      width: 200, fit: BoxFit.contain),
                ),
              ],
            ),
          );
  }
}