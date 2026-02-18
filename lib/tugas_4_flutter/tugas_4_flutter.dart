import 'package:flutter/material.dart';

class tugas4flutter extends StatelessWidget {
  const tugas4flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text("EDUCU",
        style: TextStyle(
          color: const Color.fromARGB(255, 179, 9, 9),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          //input
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.menu_book),
              labelText: "Pelajaran",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.school),
              labelText: "Guru",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.punch_clock_rounded),
              labelText: "Waktu",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.description),
              labelText: "Deskripsi",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),

          //daftar
          Text("Jadwal Pelajaran",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          ListTile(
            leading: Icon(Icons.app_shortcut),
            title: Text("App Developer"),
            subtitle: Text("Senin, 10.00 - 12.00"),
          ),
          Divider(
            color: const Color.fromARGB(255, 94, 94, 94),
          ),
          ListTile(
            leading: Icon(Icons.web_sharp),
            title: Text("Web Developer"),
            subtitle: Text("Selasa, 16.00 - 18.00"),
          ),
          Divider(
            color: const Color.fromARGB(255, 94, 94, 94),
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text("Struktur Data"),
            subtitle: Text("Rabu, 20.00 - 22.00"),
          ),
          Divider(
            color: const Color.fromARGB(255, 94, 94, 94),
          ),
          ListTile(
            leading: Icon(Icons.wifi_tethering),
            title: Text("Jaringan Komputer"),
            subtitle: Text("Kamis, 00.00 - 02.00"),
          ),
          Divider(
            color: const Color.fromARGB(255, 94, 94, 94),
          ),
          ListTile(
            leading: Icon(Icons.psychology),
            title: Text("Machine Learning"),
            subtitle: Text("Jum'at, 02.00 - 04.00"),
          ),
          Divider(
            color: const Color.fromARGB(255, 94, 94, 94),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 231, 157),
    );
  }
}