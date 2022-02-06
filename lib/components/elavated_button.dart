import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sary_assessment_app/functions/crud.dart';
import 'package:sary_assessment_app/model/item.dart';

import 'custom_alert.dart';

class ElavatedFloatingButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isTransaction;

  final Item? item;

  const ElavatedFloatingButton(
      Key? key, this.label, this.icon, this.isTransaction,
      [this.item])
      : super(key: key);

  @override
  State<ElavatedFloatingButton> createState() => _ElavatedFloatingButtonState();
}

class _ElavatedFloatingButtonState extends State<ElavatedFloatingButton> {
  // late TextEditingController _c;

  @override
  void initState() {
    super.initState();

    // _c = TextEditingController();
  }

  // @override
  // void dispose() {
  //   _c.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return widget.isTransaction == true
        ? SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              icon: Icon(widget.icon),
              label: Text(widget.label),
            ),
          )
        : widget.label == "Add Item"
            ? SizedBox(
                height: 50,
                width: screenWidth - 30,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    CustomeAlertState().addAlert(context, "a");
                    // addAlert(context);
                  },
                  icon: Icon(widget.icon),
                  label: Text(widget.label),
                ),
              )
            : SizedBox(
                height: 50,
                width: 110,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (widget.label == "Add") {
                      CRUD.addItem(
                          widget.item?.name ?? "",
                          widget.item?.sku ?? "",
                          widget.item?.desc ?? "",
                          widget.item?.price ?? 0.0);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(widget.icon),
                  label: Text(widget.label),
                ));
  }

  // Future addAlert(context) => showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //           scrollable: true,
  //           title: Text("Add Item"),
  //           content: Container(
  //             height: MediaQuery.of(context).size.height / 2,
  //             decoration:
  //                 BoxDecoration(borderRadius: BorderRadius.circular(20)),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Text("Name"),
  //                 TextField(
  //                   onChanged: (value) => print(value),
  //                   decoration:
  //                       const InputDecoration(hintText: "Enter the item name"),
  //                   controller: _c,
  //                 ),
  //                 const SizedBox(
  //                   height: 15,
  //                 ),
  //                 const Text("sku"),
  //                 const TextField(
  //                   decoration: InputDecoration(hintText: "Enter the item sku"),
  //                 ),
  //                 const SizedBox(
  //                   height: 15,
  //                 ),
  //                 const Text("desc"),
  //                 const TextField(
  //                   decoration:
  //                       InputDecoration(hintText: "Enter the item desc"),
  //                 ),
  //                 const SizedBox(
  //                   height: 15,
  //                 ),
  //                 const Text("Price"),
  //                 const TextField(
  //                   decoration:
  //                       InputDecoration(hintText: "Enter the item price"),
  //                   keyboardType: TextInputType.number,
  //                 ),
  //                 const SizedBox(
  //                   height: 30,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: const [
  //                     ElavatedFloatingButton(
  //                         label: "Add",
  //                         icon: CommunityMaterialIcons.plus,
  //                         isTransaction: false),
  //                     ElavatedFloatingButton(
  //                         label: "Cancel",
  //                         icon: CommunityMaterialIcons.minus,
  //                         isTransaction: false),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ));
}
