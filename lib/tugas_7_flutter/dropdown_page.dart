import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pelajaran",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 25, 46),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DropdownButton<String>(
              value: selected,
              hint: const Text("Pilih Pelajaran"),
              items: [
                'App Developer',
                'Web Developer',
                'Jaringan Komputer'
              ].map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selected = val;
                });
              },
            ),

            const SizedBox(height: 20),

            if (selected != null)
              Text("Anda memilih: $selected"),
          ],
        ),
      ),
    );
  }
}