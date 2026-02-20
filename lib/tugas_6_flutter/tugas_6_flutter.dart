import 'package:flutter/material.dart';

class Tugas6Flutter extends StatefulWidget {
  const Tugas6Flutter({super.key});

  @override
  State<Tugas6Flutter> createState() => _Tugas6FlutterState();
}

class _Tugas6FlutterState extends State<Tugas6Flutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("EDUCU",
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 25,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 0, 0, 51),
      // ),
      body:  
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",
              height: 150,
              width: 150,
              ),
              Text("EDUCU",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 32),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),

              Text("Hello Welcome Back",
              style: TextStyle(
                color:Color.fromARGB(255, 0, 0, 32),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10,),
              Text("Welcome back please sign in again",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
              ),
          
              SizedBox(height: 25,),

              Row(
                children: [
                  Text("Username"),
                ],
              ),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Masukkan username Anda',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("Password"),
                ],
              ),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Masukkan password Anda',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 119),
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 51),
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                        Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //Sign In With
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Or Sign In With",
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ],
                ),
        ),
      backgroundColor: Color.fromARGB(255, 214, 237, 255),
    );
  }
}