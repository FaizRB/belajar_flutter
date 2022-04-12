import 'package:belajar_flutter/ui/splashscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

bool shouldUseFirestoreEmulator = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'Belajar Flutter',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCDhKv__xMKWeO2eDmpM8RCVzCSHxojz14',
      appId: '1:572289002078:android:e004552c6a3c900d4a22cf',
      messagingSenderId: '572289002078',
      projectId: 'belajar-flutter-737ff',
    ),
  );

  if (shouldUseFirestoreEmulator) {
    //FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 80);
    FirebaseFirestore.instance.settings = const Settings(host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    )
  );
}
