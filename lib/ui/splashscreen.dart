import 'dart:async';

import 'package:belajar_flutter/ui/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/google.png",
                height: 70,
                width: 70,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Google Developer",
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<Timer> load() async {
    return Timer(const Duration(seconds: 5), navigateToHome);
  }

  void navigateToHome() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Homescreen()));
  }
}
