import 'dart:convert';

class ItemModel {
  const ItemModel({
    required this.name,
    required this.info,
    required this.quantity,
  });

  final String name;
  final String info;
  final int quantity;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'info': info,
      'quantity': quantity,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'] ?? '',
      info: map['info'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));
}
