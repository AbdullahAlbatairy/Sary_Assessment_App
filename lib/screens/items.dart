import 'package:flutter/material.dart';

import 'package:sary_assessment_app/components/custom_card.dart';
import 'package:sary_assessment_app/components/elavated_button.dart';
import 'package:sary_assessment_app/components/app_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:sary_assessment_app/screens/transaction_detail.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

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
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TransactionDetails())),
                              child: CustomCard(key, "i", "Afia Corn Oil",
                                  "PRO-SA2", "6 x 320 ml", 12.13));
                        }),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 40,
              child: ElavatedFloatingButton(
                icon: CommunityMaterialIcons.plus,
                label: "Add Item",
                isTransaction: false,
              ),
            )
          ],
        ));
  }
}
