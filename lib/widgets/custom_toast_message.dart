import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';

class CustomToastMessage extends StatefulWidget {
  const CustomToastMessage({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomToastMessage> createState() => CustomToastMessageState();
}

class CustomToastMessageState extends State<CustomToastMessage> {
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future toastMessage(context, msg) {
    timer = Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    return showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 700),
        barrierLabel: "Label",
        barrierDismissible: true,
        pageBuilder: (context, anim1, anim2) {
          return AlertDialog(
            backgroundColor: Colors.indigo,
            insetPadding: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: Text(
              msg,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0.4)).animate(anim1),
            child: child,
          );
        }).then((value) {
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });
  }
}
