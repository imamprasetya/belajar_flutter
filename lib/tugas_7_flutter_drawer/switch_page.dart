import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isOn ? Colors.blueGrey : Colors.white,
      appBar: AppBar(
        title: const Text("Mode Gelap",
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

            const Text(
              "Aktifkan Mode Gelap",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 38, 68),
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [
                Switch(
                  value: isOn,
                  onChanged: (val) {
                    setState(() {
                      isOn = val;
                    });
                  },
                ),
                Text(
                  isOn
                      ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
                      style: TextStyle(
                        color: isOn ? Colors.white : const Color.fromARGB(255, 0, 34, 51),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}