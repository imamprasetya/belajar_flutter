import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data_model.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  List<Pengajar> daftarPengajar = []; //nampung data

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String response =
        await rootBundle.loadString('assets/data_model.json');
    final List<Pengajar> data = Pengajar.fromJsonList(response);

    setState(() {
      daftarPengajar = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 1, 65),
        centerTitle: true,
        title: const Text(
          "Daftar Pengajar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: daftarPengajar.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: daftarPengajar.length,
              itemBuilder: (context, index) {
                final pengajar = daftarPengajar[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        pengajar.gambar,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      pengajar.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(pengajar.mapel),
                  ),
                );
              },
            ),
    );
  }
}

//bisa pakai ini juga
// // import 'package:flutter/material.dart';
// class Pengajar {
//   final String nama;
//   final String mapel;
//   final String gambar;
//   Pengajar({
//     required this.nama,
//     required this.mapel,
//     required this.gambar,
//   });
// }

// class ModelPage extends StatelessWidget {
//   const ModelPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Pengajar> daftarPengajar = [
//       Pengajar(
//         nama: "Naruto Uzumaki", 
//         mapel: "App Developer", 
//         gambar: "https://wallpapers.com/images/high/naruto-profile-pictures-a3nziz5klyojx6mb.webp"),
//       Pengajar(
//         nama: "Kakashi Hatake", 
//         mapel: "Web Developer", 
//         gambar: "https://upload.wikimedia.org/wikipedia/id/thumb/f/fc/Kakashi_Hatake.jpg/330px-Kakashi_Hatake.jpg"),
//       Pengajar(
//         nama: "Shikamaru Nara", 
//         mapel: "Data Analyst", 
//         gambar: "https://static0.srcdn.com/wordpress/wp-content/uploads/2019/10/Shikamaru-Nara-In-Naruto.jpg?q=50&fit=crop&w=1008&h=693&dpr=1.5"),
//       Pengajar(
//         nama: "Neji Hyuga", 
//         mapel: "Jaringan Komputer", 
//         gambar: "https://image.idntimes.com/post/20201019/neji-hyuga-71953f0af9f46ab1ffb3ad1a34b879ab.jpg?tr=w-1200,f-webp,q-75&width=1200&format=webp&quality=75"),
//       Pengajar(
//         nama: "Sasuke Uchiha", 
//         mapel: "Teknik Komputer", 
//         gambar: "https://upload.wikimedia.org/wikipedia/id/thumb/c/c6/Sasuke_Uchiha_%28Good%2CShippuden%29.jpg/330px-Sasuke_Uchiha_%28Good%2CShippuden%29.jpg"),
//       Pengajar(
//         nama: "Minato Namikaze", 
//         mapel: "Desain Grafis", 
//         gambar: "https://static0.cbrimages.com/wordpress/wp-content/uploads/2023/05/minato-s-kunai-naruto.jpg?q=50&fit=crop&w=1232&h=693&dpr=1.5"),
//       Pengajar(
//         nama: "Itachi Uchiha", 
//         mapel: "Cloud Computing", 
//         gambar: "https://image.idntimes.com/post/20200116/fakta-itachi-uchiha-0-bdbc384f4ad79e9798a65e4215b30520.png?tr=w-1200,f-webp,q-75&width=1200&format=webp&quality=75"),
//       Pengajar(
//         nama: "Madara Uchiha", 
//         mapel: "Cyber Security", 
//         gambar: "https://image.idntimes.com/post/20230529/madara-uchiha-f253478f68c4b47070f7037dbd9d285b.jpg?tr=w-1200,f-webp,q-75&width=1200&format=webp&quality=75"),
//       Pengajar(
//         nama: "Hashirama Senju", 
//         mapel: "UI/UX Designer", 
//         gambar: "https://image.idntimes.com/post/20220125/hashirama-senju-04fe26184c65e82e5b4f6dd3a8db0e7c.png?tr=w-1200,f-webp,q-75&width=1200&format=webp&quality=75"),
//       Pengajar(
//         nama: "Hagoromo Ōtsutsuki",
//         mapel: "Game Developer",
//         gambar: "https://image.idntimes.com/post/20200916/hagoromos-face-91535a31e7af3009926b9cee75d9d5f6.jpg?tr=w-1200,f-webp,q-75&width=1200&format=webp&quality=75",
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 18, 1, 65),
//         centerTitle: true,
//         title: Text("Daftar Pengajar",
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 25,
//         ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: daftarPengajar.length,
//         itemBuilder: (context, index) {
//           final Pengajar = daftarPengajar[index];
//           return Card(
//             margin: const EdgeInsets.all(10),
//             child: ListTile(
//               leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                 Pengajar.gambar,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//                 )
//               ),
//               title: Text(
//                 Pengajar.nama,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(Pengajar.mapel),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }