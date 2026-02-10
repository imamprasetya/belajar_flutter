import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 67, 49, 230),
        title: Text("PPKD Jakarta Pusat"),
        centerTitle: true,
        ),
      body: Column(
        children: [
          Text("Halo, Saya Siapa?"),
          Text("Umur : 20"),
          Text("Status : Mahasiswa"),
        ],                                       
      ),
    );
  }
}