import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox",
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
              "Saya menyetujui semua persyaratan yang berlaku",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 38, 68),
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                  },
                ),
                Text(
                  _isChecked
                      ? 'Lanjutkan pendaftaran diperbolehkan'
                      : 'Anda belum bisa melanjutkan',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}