import 'package:flutter/material.dart';
import 'package:scm_flutter/models/item_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage(this._valueSetter, {Key? key}) : super(key: key);

  final ValueSetter<ItemModel> _valueSetter;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<ItemModel> items = const [
    ItemModel(name: 'Cement', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Structural Steel', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Reinforcement Steel', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Bitumen', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'River sand', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Concrete', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Ready-mix concrete', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Binding wires', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Fly Ash', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Aggregate', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Bricks', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Blocks', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Timber (Wood)', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Limestone', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Laterite', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Thatch', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Foam', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Glass', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Gypcrete', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Plastic', info: 'PLACEHOLDER', quantity: 100),
    ItemModel(name: 'Ceramic Tiles', info: 'PLACEHOLDER', quantity: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              childrenPadding: const EdgeInsets.all(16.0),
              title: Text(
                items[index].name,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 20.0),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description: ' + items[index].info,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    IconButton(
                      onPressed: () => widget._valueSetter(items[index]),
                      icon: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, _) => const Divider(),
    );
  }
}
