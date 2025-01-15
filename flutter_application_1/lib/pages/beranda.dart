import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a Drawer to your Scaffold
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [
                  Color(0xffb51837),
                  Color(0xff661c3a),
                  Color(0xff301939),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              ),
              child: Text(
                'Slebew',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Ganti dengan aksi yang sesuai
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Ganti dengan aksi yang sesuai
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Ganti dengan aksi yang sesuai
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),  // Hamburger icon
          //   color: Colors.white,
          //   onPressed: () {
          //     // Open the Drawer when the hamburger icon is clicked
          //     Scaffold.of(context).openDrawer();
          //   },
          // ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffb51837),
                  Color(0xff661c3a),
                  Color(0xff301939),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'Dolot GunShop',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                // Handle cart navigation
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem('Pistols', Icons.sports_martial_arts),
                  _buildCategoryItem('Rifles', Icons.radar),
                  _buildCategoryItem('Ammunition', Icons.bolt),
                  _buildCategoryItem('Accessories', Icons.settings),
                  _buildCategoryItem('Knives', Icons.bug_report),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon) {
    return Container(
      width: 100.0,
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffb51837).withOpacity(0.9),
            Color(0xff661c3a).withOpacity(0.9),
            Color(0xff301939).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30.0, color: Colors.white),
          const SizedBox(height: 8.0),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 10.0, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
