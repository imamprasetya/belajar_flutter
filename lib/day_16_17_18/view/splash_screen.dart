import 'package:belajar_flutter/day_16_17_18/database/preference.dart';
import 'package:belajar_flutter/day_16_17_18/view/home.dart';
import 'package:belajar_flutter/day_16_17_18/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/extension/navigator.dart';

class SplashScreenDay16 extends StatefulWidget {
  const SplashScreenDay16({super.key});

  @override
  State<SplashScreenDay16> createState() => _SplashScreenDay16State();
}

class _SplashScreenDay16State extends State<SplashScreenDay16> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai");
    if (data == true) {
      context.pushAndRemoveAll(HomeScreen());
    } else {
      context.pushAndRemoveAll(LoginScreenDay16());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 237, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
