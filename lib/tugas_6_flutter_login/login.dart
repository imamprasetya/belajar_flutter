import 'package:flutter/material.dart';

class MasukLogin extends StatefulWidget {
  const MasukLogin({super.key});

  @override
  State<MasukLogin> createState() => _MasukLoginState();
}

class _MasukLoginState extends State<MasukLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("EDUCU",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 51),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Back")
                ),
              ],
            ),
            Text("Selamat Datang Pecinta Ilmu",
            style: TextStyle(
              fontSize: 20,
            fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
    );
  }
}