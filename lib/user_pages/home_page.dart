import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> items = [
    {"name": "Cement", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Structural Steel", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Reinforcement Steel", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Bitumen", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "River sand", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Concrete", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Ready-mix concrete", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Binding wires", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Fly Ash", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Aggregate", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Bricks", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Blocks", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Timber (Wood)", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Limestone", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Laterite", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Thatch", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Foam", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Glass", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Gypcrete", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Plastic", "info": "PLACEHOLDER", "quantity": "100"},
    {"name": "Ceramic Tiles", "info": "PLACEHOLDER", "quantity": "100"},
  ];

  Widget _buildCard(String name, String info, String quantity) {
    return Card(
      child: Column(
        children: <Widget>[Text(name), Text(info), Text(quantity)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + _auth.currentUser!.displayName.toString()),
      ),
      body: ListView(
        shrinkWrap: true,
        children: items
            .map((item) =>
                _buildCard(item["name"], item["info"], item["quantity"]))
            .toList(),
      ),
    );
  }
}
