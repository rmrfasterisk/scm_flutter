import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scm_flutter/user_pages/loading.dart';
import 'package:scm_flutter/user_pages/buyer_page.dart';
import 'package:scm_flutter/user_pages/seller_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late String _name;
  late String _email;
  late String _password;
  String _role = 'Buyer';
  final List<String> _roles = ['Buyer', 'Seller'];
  bool loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (!RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!)) {
            return 'Enter a valid email address';
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
      decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget _buildRole() {
    return DropdownButton(
        value: _role,
        items: _roles.map((String selectedRole) {
          return DropdownMenuItem(
            value: selectedRole,
            child: Text(selectedRole),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _role = value!;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                          setState(() => loading = true);
                          await _auth.createUserWithEmailAndPassword(
                              email: _email, password: _password);

                          Map<String, dynamic> userData = {
                            'name': _name,
                            'email': _email,
                            'role': _role,
                            'uid': FieldValue.increment(1)
                          };

                          await _db.collection('Users').doc(_auth.currentUser!.uid).set(userData);

                          await _auth.currentUser!.updateDisplayName(_name);
                          setState(() => loading = false);
                          if(_role=='Buyer') {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const BuyerPage()),
                                    (Route<dynamic> route) => false);
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const SellerPage()),
                                    (Route<dynamic> route) => false);
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                        ),
                        style: OutlinedButton.styleFrom(minimumSize: const Size(140.0, 50.0)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
