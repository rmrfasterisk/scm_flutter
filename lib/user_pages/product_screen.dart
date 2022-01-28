import 'package:flutter/material.dart';
import 'package:scm_flutter/models/ItemModel.dart';

class ProductPage extends StatelessWidget {
  final ValueSetter<ItemModel> _valueSetter;

  ProductPage(this._valueSetter, {Key? key}) : super(key: key);

  final List<ItemModel> items = [
    ItemModel("Cement", "PLACEHOLDER", 100),
    ItemModel("Structural Steel", "PLACEHOLDER", 100),
    ItemModel("Reinforcement Steel", "PLACEHOLDER", 100),
    ItemModel("Bitumen", "PLACEHOLDER", 100),
    ItemModel("River sand", "PLACEHOLDER", 100),
    ItemModel("Concrete", "PLACEHOLDER", 100),
    ItemModel("Ready-mix concrete", "PLACEHOLDER", 100),
    ItemModel("Binding wires", "PLACEHOLDER", 100),
    ItemModel("Fly Ash", "PLACEHOLDER", 100),
    ItemModel("Aggregate", "PLACEHOLDER", 100),
    ItemModel("Bricks", "PLACEHOLDER", 100),
    ItemModel("Blocks", "PLACEHOLDER", 100),
    ItemModel("Timber (Wood)", "PLACEHOLDER", 100),
    ItemModel("Limestone", "PLACEHOLDER", 100),
    ItemModel("Laterite", "PLACEHOLDER", 100),
    ItemModel("Thatch", "PLACEHOLDER", 100),
    ItemModel("Foam", "PLACEHOLDER", 100),
    ItemModel("Glass", "PLACEHOLDER", 100),
    ItemModel("Gypcrete", "PLACEHOLDER", 100),
    ItemModel("Plastic", "PLACEHOLDER", 100),
    ItemModel("Ceramic Tiles", "PLACEHOLDER", 100),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.all(16.0),
                title: Text(items[index].name),
                children: [
                  Text("Description: " + items[index].info),
                  const SizedBox(height: 16.0),
                  Row(children: <Widget>[
                    Text("Quantity: " + items[index].quantity.toString()),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          _valueSetter(items[index]);
                        },
                        icon: const Icon(Icons.add))
                  ])
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: items.length);
  }
}
