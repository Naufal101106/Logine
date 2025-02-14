import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response =
          await supabase.from('produk').select('NamaProduk, Harga, Stok');

      return response as List<Map<String, dynamic>>;
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  void showEditPopup(BuildContext context, Map<String, dynamic> item) {
    TextEditingController namaController =
        TextEditingController(text: item['NamaProduk']);
    TextEditingController hargaController =
        TextEditingController(text: item['Harga'].toString());
    TextEditingController stokController =
        TextEditingController(text: item['Stok'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Produk"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: "Nama Produk"),
              ),
              TextField(
                controller: hargaController,
                decoration: InputDecoration(labelText: "Harga"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: stokController,
                decoration: InputDecoration(labelText: "Stok"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                await supabase.from('produk').update({
                  'NamaProduk': namaController.text,
                  'Harga': int.parse(hargaController.text),
                  'Stok': int.parse(stokController.text),
                }).eq('NamaProduk', item['NamaProduk']);

                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Produk")),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Data tidak ditemukan"));
          } else {
            final List<Map<String, dynamic>> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                      title: Text(
                        item['NamaProduk'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Harga: Rp ${item['Harga']}"),
                          Text("Stok: ${item['Stok']}"),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => showEditPopup(context, item),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          )
                        ],
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
