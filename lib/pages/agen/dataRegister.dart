import 'package:flutter/material.dart';

class DataRegister extends StatefulWidget {
  @override
  _DataRegister createState() => _DataRegister();
}

class _DataRegister extends State<DataRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF007B43),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // Back button icon
            onPressed: () {
              // Handle back button press
              Navigator.pop(context);
            },
          ),
          title: Text(    
            'Daftar Sebagai Agen',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("langkah 1 dari 6"),
            Text("Masukan NIK dan Nomor Telepon", style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),),
            Text("Pastikan nomor telepon yang anda masukan masih aktif")
          ],
        ),
      ),
    );
  }
}
