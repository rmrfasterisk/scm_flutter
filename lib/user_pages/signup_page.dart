import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _name;
  late String _email;
  late String _password;
  late bool _role;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Name", border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name is required";
        }
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Email", border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email address is required";
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
          labelText: "Password", border: OutlineInputBorder()), obscureText: true,
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

  Widget _buildRole() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 24.0, 15.0, 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                _buildName(),
                const SizedBox(
                  height: 10.0,
                ),
                _buildEmail(),
                const SizedBox(
                  height: 10.0,
                ),
                _buildPassword(),
                const SizedBox(
                  height: 10.0,
                ),
                _buildRole(),
                const SizedBox(
                  height: 10.0,
                ),
                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                  ),
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(140.0, 50.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
