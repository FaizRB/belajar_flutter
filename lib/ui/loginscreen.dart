import 'package:belajar_flutter/ui/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pswController = TextEditingController();


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

    print("email : "+ email);
    print("psw : "+ psw);

    final prefs = await SharedPreferences.getInstance();
    if(email.isNotEmpty && psw.isNotEmpty) {
      prefs.setString("email", email);

      //masuk home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Homescreen()));
    }
  }
}
