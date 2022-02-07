import 'package:flutter/material.dart';

import 'package:community_material_icon/community_material_icon.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:sary_assessment_app/screens/transaction_detail.dart';
import 'package:sary_assessment_app/widgets/app_bar.dart';
import 'package:sary_assessment_app/widgets/custom_card.dart';
import 'package:sary_assessment_app/widgets/elavated_button.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  Key? get key => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarTrans(
          titleName: "Transactions",
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
                  searchBar(),
                  const SizedBox(
                    height: 20,
                  ),
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
                              child: CustomCard(
                                key,
                                "t",
                                "Afia Corn Oil",
                                "PRO-SA2",
                                "6 x 320 ml",
                                12.13,
                                isStock: true,
                              ));
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              child: Row(
                children: const [
                  ElavatedFloatingButton(
                    null,
                    "Send",
                    CommunityMaterialIcons.arrow_up_bold_circle_outline,
                    true,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElavatedFloatingButton(
                    null,
                    "Receive",
                    CommunityMaterialIcons.arrow_down_bold_circle_outline,
                    true,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Row searchBar() {
    return Row(
      children: [
        Flexible(
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              decoration: InputDecoration(
                focusColor: Colors.black,
                border: InputBorder.none,
                prefixIcon: Transform.rotate(
                  angle: 90 * math.pi / 180,
                  child: const IconButton(
                    icon: Icon(CommunityMaterialIcons.magnify),
                    onPressed: null,
                  ),
                ),
                hintText: "Search",
              ),
            ),
          ),
        ),
        RawMaterialButton(
          elevation: 0,
          onPressed: () {},
          child: const Icon(CommunityMaterialIcons.filter_outline),
          padding: const EdgeInsets.all(10.0),
          shape: const CircleBorder(),
          fillColor: Colors.white,
        )
      ],
    );
  }
}
