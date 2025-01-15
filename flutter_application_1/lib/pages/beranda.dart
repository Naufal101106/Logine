import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Container(
        padding: EdgeInsets.only(),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[
            Color(0xffb51837),
            Color(0xff661c3a),
            Color(0xff301939),
            ], begin: Alignment.topLeft, end: Alignment.topRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left:30.0, right: 30.0),
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset("images/anjay.png", color: Colors.white,height: 120, width: 120, fit: BoxFit.cover,),
              ),
              SizedBox(width: 50,),
              Container(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                "Dolot\nGunShop", 
                style: TextStyle(
                    color: Colors.white, 
                    fontSize: 40.0,
                )
              ),
              )
            ],
          ),
          SizedBox(height: 40.0,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: Column(children: [
              
                ],),
              ),
            )
        ],
        ),
      ), 
    );
  }
}