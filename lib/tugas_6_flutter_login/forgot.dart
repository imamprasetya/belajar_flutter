import 'package:flutter/material.dart';

class JanganLupa extends StatefulWidget {
  const JanganLupa({super.key});

  @override
  State<JanganLupa> createState() => _JanganLupaState();
}

class _JanganLupaState extends State<JanganLupa> {
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Forgot Password?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 51),
                  ),
                  ),
                ],
              ),
              Text("Don't worry! It occurs. Please enter the email address linked with your account.",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}