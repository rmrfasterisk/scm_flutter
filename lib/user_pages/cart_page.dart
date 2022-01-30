import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:scm_flutter/models/item_model.dart';

import '../constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    required this.cart,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  final List<ItemModel> cart;
  final int quantity;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: fs.collection('Users').doc(fbAuth!.uid).snapshots(),
      builder: (context, snapshot) {
        // final user = UserModel.fromMap(userDoc.data()!);
        // return isRoleBuyer ? _userIsBuyer() : _userIsSeller();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text('Document does not exist');
        }

        return Scaffold(
          floatingActionButton: const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.shopping_cart_outlined),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.cart.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.cart[index].name,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
