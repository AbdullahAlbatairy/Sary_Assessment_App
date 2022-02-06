import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_assessment_app/model/item.dart';

class Boxes {
  static Box<Item> getItems() => Hive.box<Item>("itemBox");
}
