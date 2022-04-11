import 'package:belajar_flutter/ui/loginscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("HOME", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),

              OutlinedButton(
                  onPressed: () {
                    doLogOut();
                  },
                  child: Text("Keluar")
              )
            ],
          )
        ),
      ),
    );
  }

  void doLogOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Loginscreen()));
  }
}
