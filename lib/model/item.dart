import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? sku;

  @HiveField(2)
  String? desc;
  @HiveField(3)
  double? price;
}
