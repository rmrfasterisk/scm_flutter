import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scm_flutter/models/item_model.dart';
import 'package:scm_flutter/user_pages/cart_page.dart';
import 'package:scm_flutter/user_pages/default_page.dart';
import 'package:scm_flutter/user_pages/product_screen.dart';

class BuyerPage extends StatefulWidget {
  const BuyerPage({Key? key}) : super(key: key);

  @override
  _BuyerPageState createState() => _BuyerPageState();
}

class _BuyerPageState extends State<BuyerPage> {
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
              Tab(text: 'Cart'),
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
            CartPage(cart: cart, quantity: quantity),
          ],
        ),
      ),
    );
  }
}
