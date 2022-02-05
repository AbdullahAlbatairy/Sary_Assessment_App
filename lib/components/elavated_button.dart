import 'package:flutter/material.dart';

class ElavatedFloatingButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isTransaction;

  const ElavatedFloatingButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.isTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return isTransaction == true
        ? SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              icon: Icon(icon),
              label: Text(label),
            ),
          )
        : SizedBox(
            height: 50,
            width: screenWidth - 30,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              icon: Icon(icon),
              label: Text(label),
            ),
          );
  }
}
