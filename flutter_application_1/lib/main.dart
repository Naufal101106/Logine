import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/beranda.dart';
import 'package:flutter_application_1/pages/onboarding.dart';
import 'package:flutter_application_1/pages/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
