import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Waktu Belajar",
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
        child: ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text(
            (selectedTime == null)
                ? "Pilih Jam Belajar"
                : "Jam Belajar: ${selectedTime!.format(context)}",
          ),
        ),
      ),
    );
  }
}