import 'package:flutter/material.dart';

class BikinBaru extends StatefulWidget {
  const BikinBaru({super.key});

  @override
  State<BikinBaru> createState() => _BikinBaruState();
}

class _BikinBaruState extends State<BikinBaru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("EDUCU",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 51),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Bikin Akun Baru",
            style: TextStyle(
              fontSize: 20,
            fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
    );
  }
}