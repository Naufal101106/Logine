import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/beranda.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaprodukController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  // Method to insert book data to Supabase
  Future<void> _addProduk() async {
    if (_formKey.currentState!.validate()) {
      final namaproduk = _namaprodukController.text;
      final harga = _hargaController.text;
      final stok = _stokController.text;

      // Validate input
      if (namaproduk.isEmpty || harga.isEmpty || stok.isEmpty) {
        // Show an error message if any field is empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Semua wajib diisi')),
        );
        return;
      }

      final response = await Supabase.instance.client.from('produk').insert({
        'NamaProduk': namaproduk,
        'Harga': harga,
        'Stok': stok,
      }); // Make sure to call .execute() to get the result

      // Check for errors in the response
      if (response != null) {
        // Display the actual error message from Supabase
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Error: ${response.error!.message}')), // Access error message correctly
        );
      } else {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Produk berhasil ditambahkan',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color.fromARGB(255, 168, 2, 29),
          ),
        );

        // Clear the form
        _namaprodukController.clear();
        _hargaController.clear();
        _stokController.clear();

        // Navigate back to the BookListPage and refresh the list
        // Navigator.pop(
        //     context, true); // Passing true to indicate the data has been added

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaprodukController,
                decoration: InputDecoration(labelText: 'Nama Produk'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Nama Produk!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _hargaController,
                decoration: InputDecoration(labelText: 'Harga'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Harga!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stokController,
                decoration: InputDecoration(labelText: 'Stok'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Stok!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Insert the book if the form is valid
                    _addProduk();
                  }
                },
                child: Text('Tambah Produk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}