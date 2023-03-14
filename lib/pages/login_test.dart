import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({super.key});

  @override
  State<LoginTest> createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  TextEditingController controllerUsers = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String mensaje = '';

/*
Future<List> login() async{
  final response=await htt
}
*/

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
