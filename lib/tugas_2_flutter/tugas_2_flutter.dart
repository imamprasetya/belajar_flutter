import 'package:flutter/material.dart';

class tugas2flutter extends StatelessWidget {
  const tugas2flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Soal No 1
      appBar: AppBar(
        backgroundColor: Color(0xff0D1A63),
        title: Text("EDUCU",
          style: TextStyle(
            color: Color(0xffEAEFEF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      //Soal No 2
      body: Column(
        children: [
          Center(child: Text("MAMZ",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 22, 121),
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          )
          ),

          //Soal No 3
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.email, color: const Color.fromARGB(255, 18, 0, 122)),
                    SizedBox(width: 16,),
                    Text("imam@aji.com",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 68, 124),
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.person, color: const Color.fromARGB(255, 15, 0, 100)),
                    SizedBox(width: 16,),
                    Text("12345678",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 2, 105),
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 15,),

                //Soal No 4
                Row(
                  children: [
                    Icon(Icons.location_pin, color: const Color.fromARGB(255, 12, 0, 116)),
                    SizedBox(width: 16,),
                    Text("Lokasi:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 22, 117),
                    ),
                    ),
                    Spacer(),
                    Text("Jakarta",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 22, 117),
                    ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone, color: const Color.fromARGB(255, 2, 0, 95)),
                    SizedBox(width: 16,),
                    Text("No. Telp:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 22, 117),
                    ),
                    ),
                    Spacer(),
                    Text("0987654321",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 22, 117),
                    ),
                    ),
                  ],
                ),

                //Soal No 5
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 251, 0),
                        borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text("Facebook", textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 42, 133),
                          fontWeight: FontWeight.bold,
                        ),
                        ))),
                        SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 53, 97),
                        borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text("Instragram", textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ))),
                  ],
                ),

                //Soal No 6
                SizedBox(height: 15,),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 270,
                      decoration: BoxDecoration(color: Color(0xff0B2D72), borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(color: Color(0xff0B2D72)),
                        child: Text("EDUCU Adalah aplikasi yang akan memudahkan pelajar untuk mengatur waktu belajarnya.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          
          //Soal No 7
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(color: Color.fromARGB(255, 229, 255, 206), borderRadius: BorderRadius.circular(12)),
                child: Image.asset("assets/images/logo.png")),
            ],
          ),
         
          
        ],
      ),
       backgroundColor: Color.fromARGB(255, 214, 249, 255),
    );
  }
}