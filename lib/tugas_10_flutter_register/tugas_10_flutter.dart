import 'package:belajar_flutter/tugas_10_flutter_register/homepage.dart';
import 'package:flutter/material.dart';

class Tugas10Flutter extends StatefulWidget {
  const Tugas10Flutter({super.key});

  @override
  State<Tugas10Flutter> createState() => _Tugas10FlutterState();
}

class _Tugas10FlutterState extends State<Tugas10Flutter> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 214, 237, 255),
      body: Center(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("assets/images/logo.png", height: 100, width: 100),
                //  Text(
                //   "EDUCU",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 0, 0, 51),
                //     fontSize: 40,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                 SizedBox(height: 25),
                Container(
                  height: 800,
                  padding:  EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 0, 0, 51),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:  [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                       Center(
                        child: Text(
                          "Registration Form",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       SizedBox(height: 25),

                      // NAMA
                      Row(
                        children: [
                          Text("Nama Lengkap",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ],
                      ),SizedBox(height: 8,),
                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan nama lengkap Anda',
                          prefixIcon:  Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:  BorderSide(color: Color.fromARGB(255, 214, 237, 255)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Nama wajib diisi';
                          return null;
                        },
                      ),
                       SizedBox(height: 25),

                      // EMAIL
                      Row(
                        children: [
                          Text("Email",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ],
                      ),SizedBox(height: 8,),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan alamat email Anda',
                          prefixIcon:  Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:  BorderSide(color: Color.fromARGB(255, 214, 237, 255)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Email wajib diisi';
                          if (!value.contains('@')) return 'Email harus mengandung @';
                          return null;
                        },
                      ),
                       SizedBox(height: 25),

                      // NOMOR HP
                      Row(
                        children: [
                          Text("Nomor Telepon",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ],
                      ),SizedBox(height: 8,),
                      TextFormField(
                        
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Masukkan nomor telepon',
                          prefixIcon:  Icon(Icons.phone),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:  BorderSide(color: Color.fromARGB(255, 214, 237, 255)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        controller: phoneController,
                        validator: (value) {
                          final phone = (value ?? '').trim();
                          if (phone.isEmpty) {
                            return "Nomor telepon tidak boleh kosong";
                          }
                          if (!RegExp(r'^\d+$').hasMatch(phone)){
                            return "Nomor telepon hanya boleh angka";
                          }
                          if (phone.length < 9){
                            return "Nomor telepon minimal 9";
                          }
                          if (phone.length > 15){
                            return "Nomor telepon maksimal 15 digit";
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 25),

                      // ASAL KOTA
                      Row(
                        children: [
                          Text("Asal Kota",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ],
                      ),SizedBox(height: 8,),
                      TextFormField(
                        controller: kotaController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan asal kota Anda',
                          prefixIcon:  Icon(Icons.location_on),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:  BorderSide(color: Color.fromARGB(255, 214, 237, 255)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Kota wajib diisi';
                          return null;
                        },
                      ),
                       SizedBox(height: 25),

                      // Parsing
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Color.fromARGB(255, 0, 54, 147),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("Berhasil tervalidasi");
                              dialogError(context); 
                            } else {
                              print("Tidak Berhasil tervalidasi");
                            }
                          },
                          child:  Text("DAFTAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ), SizedBox(height: 25,),

                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ALERT
  Future<dynamic> dialogError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Selamat Berhasil Terdaftar", style: TextStyle(fontSize: 24)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text("Nama: ${namaController.text}"),
              Text("Email: ${emailController.text}"),
              Text("HP: ${phoneController.text.isEmpty ? '-' : phoneController.text}"),
              Text("Kota: ${kotaController.text}"),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Batal"), 
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomepageTugas10(
                              nama: namaController.text,
                              kota: kotaController.text,
                            ),
                          ),
                        );
                      },
                      child: Text("Lanjut"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}