import 'package:belajar_flutter/extension/navigator.dart';
import 'package:belajar_flutter/tugas_11_12_flutter_crud/database/tugas_11_dbhelper.dart';
import 'package:belajar_flutter/tugas_11_12_flutter_crud/models/tugas_11_model.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/day_16_17_18/models/siswa_model.dart';
import 'package:belajar_flutter/day_16_17_18/database/siswa_controller.dart';

class UdSinau extends StatefulWidget {
  const UdSinau({super.key});

  @override
  State<UdSinau> createState() => _UdSinauState();
}

class _UdSinauState extends State<UdSinau> {
  late List<Tugas11Model> dataSinau = [];
  @override
  void initState() {
    super.initState();
    getDataSinau();
  }

  Future<void> getDataSinau() async {
    await Future.delayed(Duration(seconds: 3));
    dataSinau = await Tugas11Dbhelper.getAllsinau();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 17, 0, 112),
        title: Text(
          "Pelajaran",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: dataSinau.isEmpty || dataSinau == []
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: dataSinau.length,
              itemBuilder: (BuildContext context, int index) {
                final items = dataSinau[index];
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await showEditDialog(context, items);
                            dataSinau = await Tugas11Dbhelper.getAllsinau();
                            setState(() {});
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await showDeleteDialog(context, items.id!);
                            dataSinau = await Tugas11Dbhelper.getAllsinau();
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> showEditDialog(BuildContext context, Tugas11Model items) async {
    final pelajaranController = TextEditingController(text: items.pelajaran);
    final materiController = TextEditingController(text: items.materi);
    final guruController = TextEditingController(text: items.guru);
    final kelasController = TextEditingController(text: items.kelas);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 205, 237, 255),
          title: Text("Edit Pelajaran"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: pelajaranController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.menu_book),
                  hintText: "Masukkan Pelajaran",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 2, 0, 134),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: materiController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.library_books),
                  hintText: "Masukkan Materi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 2, 0, 134),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              TextFormField(
                controller: kelasController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.room),
                  hintText: "Masukkan Kelas",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 2, 0, 134),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await Tugas11Dbhelper.updateSinau(
                  Tugas11Model(
                    id: items.id,
                    pelajaran: pelajaranController.text,
                    materi: materiController.text,
                    guru: guruController.text,
                    kelas: kelasController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Pelajaran Diperbarui")));
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah anda yakin ingin menghapus data ini"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop(true);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
    if (confirm == true) {
      await Tugas11Dbhelper.deleteSinau(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data berhasil dihapus")));
      setState(() {});
    }
  }
}
