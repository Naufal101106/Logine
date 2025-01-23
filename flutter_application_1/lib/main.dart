import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/beranda.dart';
import 'package:flutter_application_1/pages/onboarding.dart';
import 'package:flutter_application_1/pages/signin.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Supabase.initialize(
    url: 'https://fiyvifbufphofagprjfl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpeXZpZmJ1ZnBob2ZhZ3ByamZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc1MTQwNjMsImV4cCI6MjA1MzA5MDA2M30.k6VsjNHXBh7zV01Ftyt30WWiShO6JSLr799sBVZlNtI',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Beranda(),
    );
  }
}
