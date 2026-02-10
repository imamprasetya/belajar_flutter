import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF9644),
        title: Text("Profil Saya",
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      body: 
      Column(
        children: [
          Text("Imam Aji Bagus Prasetya",
          style: TextStyle(
            fontSize: 50,
            color: const Color.fromARGB(255, 0, 2, 148),
            fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.red,),
              Text("Jakarta",
              style: TextStyle(color: const Color.fromARGB(255, 148, 1, 1),),
              ),
            ],
          ),
          Text("Saya adalah peserta App Developer di PPKD Jakarta Pusat",
          style: TextStyle(color: const Color.fromARGB(255, 0, 150, 12)),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 252, 221, 135),
    );
  }
}