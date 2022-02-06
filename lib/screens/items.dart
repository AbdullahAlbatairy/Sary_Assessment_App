import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sary_assessment_app/components/custom_alert.dart';

import 'package:sary_assessment_app/components/custom_card.dart';
import 'package:sary_assessment_app/components/elavated_button.dart';
import 'package:sary_assessment_app/components/app_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:sary_assessment_app/model/item.dart';
import 'package:sary_assessment_app/screens/transaction_detail.dart';

import '../boxes.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  Key? get key => null;
  final itemBox = Boxes.getItems();
  late List items;
  @override
  void initState() {
    items = itemBox.values.toList();
    //print(items[2].name);
    super.initState();
  }

  @override
  void dispose() {
    // Hive.close(); for all

    //Hive.box("itemBox").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarTrans(
          titleName: "Items",
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => CustomeAlertState().addAlert(
                                    context,
                                    "u",
                                    items[index],
                                  ),
                              child: CustomCard(
                                  key,
                                  "i",
                                  items[index].name,
                                  items[index].sku,
                                  items[index].desc,
                                  items[index].price));
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              child: ElavatedFloatingButton(
                key,
                "Add Item",
                CommunityMaterialIcons.plus,
                false,
              ),
            )
          ],
        ));
  }
}
