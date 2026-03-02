import 'package:belajar_flutter/tugas_11_flutter_cr/database/tugas_11_dbhelper.dart';
import 'package:belajar_flutter/tugas_11_flutter_cr/models/tugas_11_model.dart';
import 'package:flutter/material.dart';

class Tugas11Flutter extends StatefulWidget {
  const Tugas11Flutter({super.key});

  @override
  State<Tugas11Flutter> createState() => _Tugas11FlutterState();
}

class _Tugas11FlutterState extends State<Tugas11Flutter> {
  final TextEditingController pelajaranController = TextEditingController();
  final TextEditingController materiController = TextEditingController();
  final TextEditingController guruController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SINAU",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 7, 0, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: pelajaranController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.menu_book),
                hintText: "Masukkan mata pelajaran",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 2, 0, 134),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: materiController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.library_books),
                hintText: "Masukkan materi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 2, 0, 134),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: guruController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.school),
                hintText: "Masukkan nama guru",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 2, 0, 134),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: kelasController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.room),
                hintText: "Masukkan kelas",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 2, 0, 134),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (pelajaranController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Pelajaran Belum Diisi")),
                    );
                    return;
                  }
                  if (materiController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Materi Belum Diisi")),
                    );
                    return;
                  }
                  if (guruController.text.isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Guru Belum Diisi")));
                    return;
                  }
                  if (kelasController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kelas Belum Diisi")),
                    );
                    return;
                  }
                  Tugas11Dbhelper.registerSinau(
                    Tugas11Model(
                      pelajaran: pelajaranController.text,
                      materi: materiController.text,
                      guru: guruController.text,
                      kelas: kelasController.text,
                    ),
                  );
                  pelajaranController.clear();
                  materiController.clear();
                  guruController.clear();
                  kelasController.clear();
                  setState(() {});
                },
                child: Text("Tambah"),
              ),
            ),
            SizedBox(height: 15),

            pelajaranWidget(),
          ],
        ),
      ),
    );
  }
}

FutureBuilder<List<Tugas11Model>> pelajaranWidget() {
  return FutureBuilder<List<Tugas11Model>>(
    future: Tugas11Dbhelper.getAllsinau(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataSiswa = snapshot.data as List<Tugas11Model>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataSiswa.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataSiswa[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 208, 234, 255),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 2, 97),
                  blurRadius: 7,
                  offset: Offset(1, 4),
                ),
              ],
            ),
            child: ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: const Color.fromARGB(255, 18, 0, 100),
                  ),
                  SizedBox(width: 10),
                  Text(
                    items.pelajaran,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.library_books,
                        size: 20,
                        color: const Color.fromARGB(255, 0, 117, 0),
                      ),
                      SizedBox(width: 10),
                      Text(items.materi),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: 20,
                        color: const Color.fromARGB(255, 221, 151, 1),
                      ),
                      SizedBox(width: 10),
                      Text(items.guru),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.room,
                        size: 20,
                        color: const Color.fromARGB(255, 207, 0, 0),
                      ),
                      SizedBox(width: 10),
                      Text(items.kelas),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
