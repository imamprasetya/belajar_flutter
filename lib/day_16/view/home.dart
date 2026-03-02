import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 237, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Haloo"))],
      ),
    );
  }
}
