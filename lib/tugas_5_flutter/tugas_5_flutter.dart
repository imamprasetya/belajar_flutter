import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  bool showNama = false;
  bool isLike = false;
  bool simpan = false;
  bool showDetails = false;
  bool kotak = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 147, 6),
        title: Text("TUGAS 5 DAY 10",
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 239, 186),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //ElevatedButton
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    showNama = !showNama;
                  });
              },
              child: Text(showNama ? "Tampilkan Nama" : "Sembunyikan Nama"),
               ),
            ),
             if (showNama)
             Text("Imam Aji"),
              SizedBox(height: 20,),
        
             //IconButton
            Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
             Column(
               children: [
                 IconButton(
                    icon: Icon(Icons.favorite),
                    color: isLike? Colors.red : const Color.fromARGB(255, 255, 255, 255),
                    onPressed: (){
                      setState(() {
                        isLike = !isLike;
                      });
                  },
                  ),
               ],
             ),
              if (isLike)
              Text("Disukai"),
             Column(
               children: [
                 IconButton(
                    icon: Icon(Icons.bookmark),
                    color: simpan? const Color.fromARGB(255, 0, 15, 99) : Colors.white,
                    onPressed: (){
                      setState(() {
                        simpan = !simpan;
                      });
                  },
                  ),
               ],
             ),
              if (simpan)
              Text("Disimpan"),
            ],),

              //TextButton
              TextButton(
                onPressed: (){
                  setState(() {
                    showDetails = !showDetails;
                  });
                }, 
                child: Text("Lihat Selengkapnya"),
                ),
                if (showDetails)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Belajarlah dengan sungguh-sungguh karena seseorang akan mulia jika bersama ilmu yang luhur.", textAlign: TextAlign.center,),
                ),
        
              //InkWell
              InkWell(
                onTap: () {
                  setState(() {
                    kotak = !kotak;
                  });
                  print("Kotak berhasil disentuh!");
                },
                child: Container(
                  width: 50,
                  height: 25,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    "KLIK!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              if (kotak)
                Text("Jangan klik terus"),
              SizedBox(height: 20,),
        
              //GestureDetector
              GestureDetector(
                onTap: () {
                  setState(() {
                    counter += 1;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    counter += 2;
                  });
                },
                onLongPress: () {
                  setState(() {
                    counter += 3;
                  });
                },
                child: Container(
                  width: 200,
                  height: 100,
                  color: const Color.fromARGB(255, 182, 136, 0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Jumlah: $counter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter -= 1; 
          });
        },
        backgroundColor: const Color.fromARGB(255, 182, 136, 0),
        child: const Icon(Icons.remove),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 233, 160),
    );
  }
}