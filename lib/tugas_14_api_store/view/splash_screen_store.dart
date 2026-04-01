import 'dart:async';
import 'package:flutter/material.dart';
import 'home_store_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeStoreScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.store, size: 100, color: Colors.white),

            SizedBox(height: 20),

            Text(
              "TOKOMASAJI",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),

            Text("Loading...", style: TextStyle(color: Colors.white70)),

            SizedBox(height: 30),

            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
