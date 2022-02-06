import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sary_assessment_app/components/elavated_button.dart';
import 'package:sary_assessment_app/model/item.dart';

import '../boxes.dart';

class CRUD {
  static Future addItem(
      String name, String sku, String desc, double price) async {
    if (name != "" && sku != "" && desc != "" && price != 0.0) {
      final item = Item()
        ..name = name
        ..sku = sku
        ..desc = desc
        ..price = price;
      final itemBox = Boxes.getItems();
      itemBox.add(item); // add new item
    } else {
      print("missing values");
    }
  }
}
