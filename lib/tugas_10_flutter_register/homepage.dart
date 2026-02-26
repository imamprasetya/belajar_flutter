import 'package:flutter/material.dart';

class HomepageTugas10 extends StatelessWidget {
  final String nama;
  final String kota;

  const HomepageTugas10({super.key, required this.nama, required this.kota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pendaftaran Berhasil")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Terima kasih, $nama dari $kota telah mendaftar.",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}