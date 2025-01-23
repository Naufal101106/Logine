import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboarding.dart';
import 'package:flutter_application_1/pages/password.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      final response = await Supabase.instance.client.auth.signUp(
        password: password,
        data: {'username': username},
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registrasi berhasil!')),
        );
        _usernameController.clear();
        _passwordController.clear();
      } else if (response.error != null) {
        throw response.error!;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi gagal: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Hello\nSign Up!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 55.0, left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Color(0xFFB51837),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email_outlined)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        }
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Color(0xffb51837),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Form(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.password),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password tidak boleh kosong';
                          } else if (value.length < 6) {
                            return 'Password harus minimal 6 karakter';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: (70.0),
                    ),
                    _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _register,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffb51837),
                              Color(0xff661c3a),
                              Color(0xff301939),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension on AuthResponse {
  get error => null;
}