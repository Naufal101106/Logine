import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/beranda.dart';
import 'package:flutter_application_1/pages/password.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  //fungsi login dengan memverifikasi username dan password di supabase
  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      final response = await supabase
          .from('user')
          .select('username, password')
          .eq('username', username)
          .maybeSingle();

      if (response == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username tidak ditemukan!')),
        );
        return;
      }

      if (response['password'] == password) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Beranda()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password salah!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
      );
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
                "Hello\nSign in!",
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
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email_outlined),
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
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Password(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 72, 120),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    ElevatedButton(
                      onPressed: _login,
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
                            "SIGN IN",
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