import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scm_flutter/models/userModel.dart';

class CartPage extends StatelessWidget {
  final cart;
  final quantity;
  var isRoleBuyer = false;

  CartPage(this.cart, this.quantity);

  Widget _userIsBuyer() {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(onPressed: null, child: Icon(Icons.shopping_cart),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.all(16.0),
                        title: Text(cart[index].name),
                        children: [
                          Text("Description: " + cart[index].info),
                          const SizedBox(height: 16.0),
                          Row(children: <Widget>[
                            Text("Quantity: " + cart[index].quantity.toString()),
                            const Spacer(),
                          ])
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: cart.length,
                shrinkWrap: true,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _userIsSeller() {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(onPressed: null, child: Icon(Icons.add),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.all(16.0),
                        title: Text(cart[index].name),
                        children: [
                          Text("Description: " + cart[index].info),
                          const SizedBox(height: 16.0),
                          Row(children: <Widget>[
                            Text("Quantity: " + cart[index].quantity.toString()),
                            const Spacer(),
                          ])
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: cart.length,
                shrinkWrap: true,
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore _db = FirebaseFirestore.instance;

    return StreamBuilder<DocumentSnapshot>(
      stream: _db.collection("Users").doc(_auth!.uid).snapshots(),
        builder: (context, snapshot) {
        final userDoc = _db.collection("Users").doc(_auth!.uid).get();
       // final user = UserModel.fromMap(userDoc.data()!);
      return isRoleBuyer ? _userIsBuyer() : _userIsSeller();
    });
  }
}
