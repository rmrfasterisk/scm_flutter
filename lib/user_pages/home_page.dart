//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scm_flutter/models/ItemModel.dart';
import 'package:scm_flutter/user_pages/cart_page.dart';
import 'package:scm_flutter/user_pages/product_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

  List<ItemModel> cart = [];
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Welcome " + _auth.currentUser!.displayName.toString()),
            bottom: const TabBar(
                tabs: <Widget>[Tab(text: "Products"), Tab(text: "Cart")]),
          ),
          body: TabBarView(
            children: [
              ProductPage((selectedItem) {
                setState(() {
                  cart.add(selectedItem);
                });
              }),
              CartPage(cart, quantity)
            ],
          ),
        ));
  }
}
