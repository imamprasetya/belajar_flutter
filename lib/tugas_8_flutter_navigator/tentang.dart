import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 25, 46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "Aplikasi Management  Waktu Belajar",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Text(
              "Aplikasi ini dirancang untuk membantu pecinta ilmu untuk mengatur waktu belajarnya agar efektif. Sehingga, diharap dapat lebih banyak manusia cerdas yang akan saling membantu dalam kebaikan."
            ),

            SizedBox(height: 20),

            Text("Nama Pembuat: Mas Imam"),
            SizedBox(height: 8),
            Text("Versi Aplikasi: 1.0.0"),
          ],
        ),
      ),
    );
  }
}