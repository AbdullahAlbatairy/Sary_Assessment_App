import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sary_assessment_app/model/item.dart';

import 'elavated_button.dart';

class CustomeAlert extends StatefulWidget {
  CustomeAlert({Key? key}) : super(key: key);

  @override
  State<CustomeAlert> createState() => CustomeAlertState();
}

class CustomeAlertState extends State<CustomeAlert> {
  TextEditingController? _c;
  late Item item = Item();

  Key? get key => null;
  @override
  void initState() {
    super.initState();
    //item = Item();
    _c = TextEditingController();
  }

  // @override
  // void dispose() {
  //   //_c.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => addAlert(context));
    return Container();
  }

  Future addAlert(context, type, [itemUpdate]) => showDialog(
      context: context,
      builder: (context) {
        return type == "a"
            ? AlertDialog(
                scrollable: true,
                title: const Text("Add Item"),
                content: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name"),
                      TextFormField(
                        validator: (value) {
                          if (value == "null")
                            return "Please Enter a valid price";
                        },
                        onChanged: (value) {
                          item.name = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item name"),
                        controller: _c,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("sku"),
                      TextField(
                        onChanged: (value) {
                          item.sku = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item sku"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("desc"),
                      TextField(
                        onChanged: (value) {
                          item.desc = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item desc"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Price"),
                      TextFormField(
                        validator: (value) {
                          if (value == "null")
                            return "Please Enter a valid price";
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty)
                            item.price = double.parse(value);
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item price"),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElavatedFloatingButton(
                            key,
                            "Add",
                            CommunityMaterialIcons.plus,
                            false,
                            item,
                          ),
                          ElavatedFloatingButton(
                            key,
                            "Cancel",
                            CommunityMaterialIcons.minus,
                            false,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : AlertDialog(
                scrollable: true,
                title: const Text("Update Item"),
                content: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name"),
                      TextFormField(
                        initialValue: itemUpdate.name,
                        validator: (value) {
                          if (value == "null")
                            return "Please Enter a valid price";
                        },
                        onChanged: (value) {
                          itemUpdate.name = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item name"),
                        controller: _c,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("sku"),
                      TextFormField(
                        initialValue: itemUpdate.sku,
                        onChanged: (value) {
                          itemUpdate.sku = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item sku"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("desc"),
                      TextFormField(
                        initialValue: itemUpdate.desc,
                        onChanged: (value) {
                          itemUpdate.desc = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item desc"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Price"),
                      TextFormField(
                        initialValue: itemUpdate.price.toString(),
                        validator: (value) {
                          if (value == "null")
                            return "Please Enter a valid price";
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            itemUpdate.price = double.parse(value);
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter the item price"),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElavatedFloatingButton(
                            key,
                            "Update",
                            CommunityMaterialIcons.plus,
                            false,
                            itemUpdate,
                          ),
                          ElavatedFloatingButton(
                            key,
                            "Cancel",
                            CommunityMaterialIcons.minus,
                            false,
                          ),
                          ElavatedFloatingButton(key, "Delete",
                              CommunityMaterialIcons.minus, false, itemUpdate),
                        ],
                      )
                    ],
                  ),
                ),
              );
      });
}
