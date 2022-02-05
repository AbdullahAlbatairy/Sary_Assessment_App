import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:sary_assessment_app/components/card.dart';
import 'package:sary_assessment_app/components/elavated_button.dart';
import 'package:sary_assessment_app/components/app_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

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
                              onTap: () => print("hi"),
                              child: card(key, false, "Afia Corn Oil",
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
