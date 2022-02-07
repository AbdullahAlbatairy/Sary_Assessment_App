import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sary_assessment_app/model/item.dart';

import '../boxes.dart';

class CRUD with ChangeNotifier {
  List<Item> _itemBox = [];
  final itemBox = Boxes.getItems();

  int getItemsCount() {
    _itemBox = itemBox.values.toList();
    return _itemBox.length;
  }

  // List<Item> getItems() {
  //   _itemBox = itemBox.values.toList();
  //   return _itemBox;
  // }

  Item getItem(index) {
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
