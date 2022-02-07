import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:sary_assessment_app/screens/items.dart';

class AppBarTrans extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;

  const AppBarTrans({Key? key, required this.titleName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return titleName == "Transactions"
        ? AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  titleName,
                  style: const TextStyle(color: Colors.black),
                ),
                IconButton(
                  icon: const Icon(
                    CommunityMaterialIcons.tag_plus,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Items()));
                  },
                )
              ],
            ),
          )
        : AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              titleName,
              style: const TextStyle(color: Colors.black),
            ),
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
