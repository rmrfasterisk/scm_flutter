import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scm_flutter/models/item_model.dart';
import 'package:scm_flutter/user_pages/default_page.dart';
import 'package:scm_flutter/user_pages/product_screen.dart';

import 'add_item.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({Key? key}) : super(key: key);

  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  final _auth = FirebaseAuth.instance;

  int quantity = 0;
  List<ItemModel> cart = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome ' + _auth.currentUser!.displayName.toString()),
          actions: [
            IconButton(onPressed: () async {
              await _auth.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const DefaultPage()),
                      (Route<dynamic> route) => false);
            }
                , icon: const Icon(Icons.logout))
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Products'),
              Tab(text: 'Add Item'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductPage((selectedItem) {
              setState(() {
                cart.add(selectedItem);
              });
            }),
            AddItem(),
          ],
        ),
      ),
    );
  }
}
