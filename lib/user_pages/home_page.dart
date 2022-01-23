import 'package:flutter/material.dart';
import 'package:scm_flutter/user_pages/login_page.dart';
import 'package:scm_flutter/user_pages/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Supply Chain Management"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/truck.jpg',
                  scale: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(140.0, 50.0)),
                    child: const Text("Login", style: TextStyle(fontSize: 18.0))),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(140.0, 50.0)),
                  child: const Text("Sign Up", style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
