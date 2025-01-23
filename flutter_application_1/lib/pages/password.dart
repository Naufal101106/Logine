import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffb51837),
              Color(0xff661c3a),
              Color(0xff301939),
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}