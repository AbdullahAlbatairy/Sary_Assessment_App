import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sary_assessment_app/components/elavated_button.dart';
import 'package:sary_assessment_app/model/item.dart';

import '../boxes.dart';

class CRUD with ChangeNotifier {
  List<Item> _itemBox = [];
  final itemBox = Boxes.getItems();

  // void getItem() {
  //   final itemBox = Boxes.getItems();

  //   _itemBox = itemBox.values.toList();

  //   notifyListeners();
  // }

  // Item getItems(index) {
  //   return _itemBox[index];
  // }

  // List<Item> getActiveItem() {
  //   return _itemBox;
  // }
  int getItemsCount() {
    final itemBox = Boxes.getItems();
    _itemBox = itemBox.values.toList();
    return _itemBox.length;
  }

  List<Item> getItems() {
    final itemBox = Boxes.getItems();
    _itemBox = itemBox.values.toList();
    return _itemBox;
  }

  Item getItem(index) {
    final itemBox = Boxes.getItems();
    _itemBox = itemBox.values.toList();
    return _itemBox[index];
  }

  Future addItem(String name, String sku, String desc, double price) async {
    if (name != "" && sku != "" && desc != "" && price != 0.0) {
      final item = Item()
        ..name = name
        ..sku = sku
        ..desc = desc
        ..price = price;

      itemBox.add(item); // add new item

      notifyListeners();
    } else {
      print("missing values");
    }
  }

  void editItem(Item item, String name, String sku, String desc, double price) {
    item.name = name;
    item.sku = sku;
    item.desc = desc;
    item.price = price;

    item.save();
    notifyListeners();
  }

  void deleteItem(Item item) {
    item.delete();

    notifyListeners();
  }
}
