import 'package:eventos_flutter/pages/login_test.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 30.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Row(
        children: [
          Image.asset("assets/images/logo_app.png",
              width: 100, fit: BoxFit.contain),
          const Spacer(),
          const CircleAvatar(
            radius: 26.0,
            backgroundImage: NetworkImage(
                "https://blog.photofeeler.com/wp-content/uploads/2017/09/tinder-photo-size-tinder-picture-size-tinder-aspect-ratio-image-dimensions-crop.jpg"),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "BIENVENIDO",
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 229, 255),
                    fontSize: 12.0,
                    decoration: TextDecoration.none),
              ),
              Text(
                "Juan123",
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 229, 255),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
