import 'package:belajar_flutter/day_16_17_18/database/siswa_controller.dart';
import 'package:belajar_flutter/day_16_17_18/models/siswa_model.dart';
import 'package:belajar_flutter/day_16_17_18/utils/decoration_form.dart';
import 'package:flutter/material.dart';

class CrSiswaScreenDay17 extends StatefulWidget {
  const CrSiswaScreenDay17({super.key});

  @override
  State<CrSiswaScreenDay17> createState() => _CrSiswaScreenDay17State();
}

class _CrSiswaScreenDay17State extends State<CrSiswaScreenDay17> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: decorationConstant(hintText: 'Masukkan Nama Siswa'),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: kelasController,
            decoration: decorationConstant(hintText: 'Masukkan Kelas Siswa'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Nama Belum Diisi")));
                return;
              }
              if (kelasController.text.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Kelas Belum Diisi")));
                return;
              }
              SiswaController.registerSiswa(
                SiswaModel(
                  nama: nameController.text,
                  kelas: kelasController.text,
                ),
              );
              nameController.clear();
              kelasController.clear();
              setState(() {});
            },
            child: Text("Tambah Siswa"),
          ),
          siswaWidget(),
        ],
      ),
    );
  }
}

FutureBuilder<List<SiswaModel>> siswaWidget() {
  return FutureBuilder<List<SiswaModel>>(
    future: SiswaController.getAllSiswa(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataSiswa = snapshot.data as List<SiswaModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataSiswa.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataSiswa[index];
          return ListTile(title: Text(items.nama), subtitle: Text(items.kelas));
        },
      );
    },
  );
}
