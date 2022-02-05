import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class card extends StatelessWidget {
  final bool transaction;
  final String name;
  final String sku;
  final String desc;
  final double price;
  final bool? isStock;
  final bool? isDisc;

  const card(
    Key? key,
    this.transaction,
    this.name,
    this.sku,
    this.desc,
    this.price, {
    this.isStock,
    this.isDisc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transaction == true
        ? Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        sku,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        desc,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$price SR",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          isStock == true
                              ? const Text(
                                  "Stock in",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  "Stock out",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                          const SizedBox(
                            width: 5,
                          ),
                          isStock == true
                              ? const Icon(
                                  CommunityMaterialIcons
                                      .arrow_down_thin_circle_outline,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  CommunityMaterialIcons
                                      .arrow_up_thin_circle_outline,
                                  color: Colors.red,
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
                    ],
                  ),
                )
              ],
            ))
        : Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Image(
                  image: NetworkImage(
                      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        sku,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        desc,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$price SR",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}
