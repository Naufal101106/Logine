import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  var produk;
  @override
  initState(){
  ({super.initState()});
  vatch();
  }
      vatch()async{
    var  response = await Supabase.instance.client.from('produk').select();
    setState(() {
      produk = response;
    });
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: produk == null?Center(child: CircularProgressIndicator(),):ListView(
        children: [
          
          GridView.count(
              crossAxisCount: 2,
              children: [...List.generate(produk.length, (index){
               return Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text('${produk[index]['NamaProduk']}'),
                    Text('${produk[index]['Harga']}'),
                    Text('${produk[index]['Stok']}')
                  ],
                ),
               );
              })],)
       
        ],
      ),
    );
  }
}