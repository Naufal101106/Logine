import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signin.dart';
import 'package:flutter_application_1/pages/signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _Onboardingtate();
}

class _Onboardingtate extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[
            Color(0xffb51837),
            Color(0xff661c3a),
            Color(0xff301939),
            ], begin: Alignment.topLeft, end: Alignment.topRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/anjay.png",
              color: Colors.white,height: 120, width: 120, fit: BoxFit.cover,
            ),
            const Text(" DOLOT GUNSHOP", style: TextStyle(color: Colors.white, fontSize: 28.0), ),
            const SizedBox(height:80.0,),
            const Text("Selamat Datang", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),),

            const SizedBox(height: 40.0,),
           Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0), // Padding luar
            margin: const EdgeInsets.symmetric(horizontal: 30.0), // Margin luar
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0), // Padding dalam tombol
                backgroundColor: Colors.transparent, // Latar belakang transparan
                foregroundColor: Colors.white, // Warna teks
                shadowColor: Colors.transparent, // Menghilangkan bayangan tombol
                side: const BorderSide(color: Colors.white, width: 2), // Border putih
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Membuat border melengkung
                ),
                
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: const Text(
                "SIGN IN",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),


            const SizedBox(height: 20.0,),
            InkWell(
              onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
              child: Container(
                padding: const EdgeInsets.only(top: 11.0, bottom: 11.0),
                margin: const EdgeInsets.only(left:30.0, right: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
                child:const Center(
                  child: Text("SIGN UP", style: TextStyle(
                    color: Colors.black, 
                    fontSize: 24.0, 
                    fontWeight: FontWeight.w500), ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/6,),
              Text(
                "Login With Social Media", 
                style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20.0,
                )
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      "images/anjay.png", 
                      height: 38, 
                      width: 38, 
                      fit: BoxFit.cover,),
                ),
                SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      "images/anjay.png", 
                      height: 38, 
                      width: 38, 
                      fit: BoxFit.cover,),
                ),
                SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      "images/anjay.png", 
                      height: 38, 
                      width: 38, 
                      fit: BoxFit.cover,),
                )
                
              ],)
          ],
        ),
      )
    );
  }
}