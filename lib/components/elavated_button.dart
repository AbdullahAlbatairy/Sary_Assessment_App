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
                    } else if (widget.label == "Update") {
                      CRUD.editItem(
                          widget.item!,
                          widget.item?.name ?? "",
                          widget.item?.sku ?? "",
                          widget.item?.desc ?? "",
                          widget.item?.price ?? 0.0);
                    } else if (widget.label == "Delete") {
                      print("here");
                      CRUD.deleteItem(widget.item!);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(widget.icon),
                  label: Text(widget.label),
                ));
  }
}
