import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scm_flutter/user_pages/home_page.dart';

import 'loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Email", border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (!RegExp(
                  r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!)) {
            return "Enter a valid email address";
          }
        }
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Password", border: OutlineInputBorder()),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
        body: SafeArea(
      child: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 24.0, 15.0, 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildEmail(),
                const SizedBox(height: 10.0),
                _buildPassword(),
                const SizedBox(height: 10.0),
                OutlinedButton(
                  onPressed: () async {
                    setState(() => loading = true);
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }

                    _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    setState(() => loading = false);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                  ),
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(140.0, 50.0)),
                )
              ],
            ),
          )),
    ));
  }
}
