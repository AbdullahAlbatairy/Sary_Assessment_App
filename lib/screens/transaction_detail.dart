import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sary_assessment_app/components/app_bar.dart';
import 'package:sary_assessment_app/components/card.dart';
import 'package:sary_assessment_app/components/elavated_button.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarTrans(
          titleName: "Transaction Details",
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: CustomCard(
              key,
              "d",
              "Afia Corn Oil",
              "PRO-SA2",
              "6 x 320 ml",
              12.13,
              isStock: true,
            )));
  }
}
