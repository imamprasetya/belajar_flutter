// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'login_screen_t15.dart'; // arahkan ke login kamu

// class SplashScreenT15 extends StatefulWidget {
//   const SplashScreenT15({super.key});

//   @override
//   State<SplashScreenT15> createState() => _SplashScreenT15State();
// }

// class _SplashScreenT15State extends State<SplashScreenT15> {
//   @override
//   void initState() {
//     super.initState();

//     // Delay 3 detik lalu pindah ke Login
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginScreenT15()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Logo / Icon
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.lock, size: 60, color: Colors.orange),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "MasMam",
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Text(
//               "Welcome to the MasMam",
//               style: TextStyle(color: Colors.black54),
//             ),

//             const SizedBox(height: 40),

//             // Loading Indicator
//             const CircularProgressIndicator(color: Colors.white),
//           ],
//         ),
//       ),
//     );
//   }
// }
