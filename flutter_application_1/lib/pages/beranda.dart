import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/insert.dart';
import 'package:flutter_application_1/pages/produk.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
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
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu, color: Colors.white,),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Membuka drawer
                  },
                );
              },
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              tabs: [
                Tab(icon: Icon(Icons.drafts), text: 'Detail Penjualan'),
                Tab(icon: Icon(Icons.person_2_sharp), text: 'Customer'),
                Tab(icon: Icon(Icons.shopping_bag), text: 'Produk'),
                Tab(icon: Icon(Icons.shopping_cart), text: 'Penjualan'),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[
                    Color(0xffb51837),
                    Color(0xff661c3a),
                    Color(0xff301939),
                    ], begin: Alignment.topLeft, end: Alignment.topRight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context); // Menutup drawer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Home selected')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pop(context); // Menutup drawer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logout selected')),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                children: [
                  Center(child: Text('Detail Penjualan Content')),
                  // PelangganTab(),
                  Insert(),
                  Produk(),
                  Center(child: Text('Penjualan Content')),
                ],
              ),
            ],
            
          ),
        ),
      ),
      );
  }

  // Widget icon (String name, IconData icon) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: DefaultTabController(
  //       length: 4,
  //       child: Container(
  //         width: 100.0,
  //         margin: const EdgeInsets.all(6.0),
  //         padding: const EdgeInsets.all(14.0),
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: [
  //               Color(0xffb51837).withOpacity(0.9),
  //               Color(0xff661c3a).withOpacity(0.9),
  //               Color(0xff301939).withOpacity(0.9),
  //             ],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //           ),
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(icon, size: 30.0, color: Colors.white),
  //             const SizedBox(height: 8.0),
  //             Text(
  //               name,
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(
  //                   fontSize: 10.0, fontWeight: FontWeight.w600, color: Colors.white),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
