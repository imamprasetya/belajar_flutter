import 'package:belajar_flutter/day_16_17_18/database/preference.dart';
import 'package:belajar_flutter/day_16_17_18/database/sqflite.dart';
import 'package:belajar_flutter/day_16_17_18/models/user_model.dart';
import 'package:belajar_flutter/day_16_17_18/view/home.dart';
import 'package:belajar_flutter/extension/navigator.dart';
import 'package:belajar_flutter/tugas_6_flutter_login/forgot.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/day_16_17_18/view/home.dart';

class LoginScreenDay16 extends StatefulWidget {
  const LoginScreenDay16({super.key});

  @override
  State<LoginScreenDay16> createState() => _LoginScreenDay16State();
}

class _LoginScreenDay16State extends State<LoginScreenDay16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 120, width: 120),
            Text(
              "EDUCU",
              style: TextStyle(
                color: Color.fromARGB(255, 12, 12, 110),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            Text(
              "Hello Welcome Back",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 32),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "Sign in to your account. Have a good time",
              style: TextStyle(color: Colors.blueGrey),
            ),

            SizedBox(height: 35),

            Row(children: [Text("Username")]),
            SizedBox(height: 5),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Masukkan username Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(children: [Text("Password")]),
            SizedBox(height: 5),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Masukkan password Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(height: 20),

            //Lupa Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JanganLupa()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 119),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            //Login
            // Row(
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //       onTap: () {
            //         Navigator.pushNamed(context, '/home');
            //       },
            //       child: Stack(
            //         alignment: Alignment.center,
            //         children: [
            //           Container(
            //             height: 50,
            //             decoration: BoxDecoration(
            //               color: Color.fromARGB(255, 0, 0, 51),
            //               borderRadius: BorderRadius.circular(50)
            //             ),
            //           ),
            //           Text("LOGIN",
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //           ),
            //         ],
            //       ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 0, 51),
                ),
                onPressed: () async {
                  final UserModel? login = await DBHelper.loginUser(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (login != null) {
                    PreferenceHandler().storingIsLogin(true);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Login Berhasil")));
                    await Future.delayed(Duration(seconds: 2));
                    context.push(HomeScreen());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Login gagal, email atau password tidak terdaftar",
                        ),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            //pendaftaran
            SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 0, 51),
                ),
                onPressed: () {
                  DBHelper.registerUser(
                    UserModel(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Pendaftaran Berhasil")),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            //Sign In With
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.blueGrey)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Or Sign In With",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                Expanded(child: Divider(thickness: 1, color: Colors.blueGrey)),
              ],
            ),
            SizedBox(height: 20),

            //Sosmed
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: Color.fromARGB(255, 229, 243, 255),
                    ),
                    onPressed: () async {
                      var dataIsLogin = PreferenceHandler.getIsLogin();
                      print(dataIsLogin);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png", height: 30),
                        SizedBox(width: 8),
                        Text(
                          "Google",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 229, 243, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/facebook.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Facebook",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 51),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 35),

            //Punya akun?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 51),
                      fontWeight: FontWeight.bold,
                    ),
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
