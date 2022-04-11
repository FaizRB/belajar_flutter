
import 'package:belajar_flutter/ui/homescreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance;

  @override
  void initState() {
    _initializeFirebase();
    super.initState();
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding:
                  const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                controller: pswController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding:
                  const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    doLogin();
                  },
                  child: Text("Masuk")
              )
            ],
          ),
        ),
      ),
    ));
  }

  void doLogin() async {
    var email = emailController.text.toString();
    var psw = pswController.text.toString();

    var dataUser = {
      "email": "lasdkfcnsl",
      "nama": "slkdmcs",
      "nohp": "sldkf",
      "ttl" : "osamdclkds"
    };


    final DatabaseReference userRef = FirebaseDatabase.instance.ref("users").child('wistawan');
    userRef.set(dataUser);

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection = _firestore.collection('wisatawan');
    _mainCollection.add(dataUser).then((value) => {
      print("Sukses!"+ value.id)
    });

    final prefs = await SharedPreferences.getInstance();
    if(email.isNotEmpty && psw.isNotEmpty) {
      prefs.setString("email", email);

      //masuk home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Homescreen()));
    }
  }


}
