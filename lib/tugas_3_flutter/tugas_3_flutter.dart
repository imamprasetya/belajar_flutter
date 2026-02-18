import 'package:flutter/material.dart';

class tugas3flutter extends StatelessWidget {
  const tugas3flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 86, 125),
        centerTitle: true,
        title: const Text(
          'Jadwal Belajar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Pelajaran',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Guru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Waktu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Deskripsi Pelajaran',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                buildGridItem(Colors.amber, 'Belajarlah'),
                buildGridItem(Colors.purple, 'Karena'),
                buildGridItem(Colors.green, 'Akan Ada'),
                buildGridItem(Colors.red, 'Keindahan'),
                buildGridItem(Colors.black, 'Setelah'),
                buildGridItem(Colors.blue, 'Kesusahan'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 104, 255, 255),
    );
  }

  //stack
  Widget buildGridItem(Color color, String text) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

}