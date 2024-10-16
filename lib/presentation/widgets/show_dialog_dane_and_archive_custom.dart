import 'package:flutter/material.dart';

import '../../shared/styles/color_app.dart';

Future<dynamic> showDialogDaneAndArchiveCustom(
  context, {
  required IconData icon,
  required String pathImage,
  required String text,
  required String textButton,
  required Function() onPressed,
}) async {
  return await showDialog<String>(
    context: context,
    builder: (BuildContext context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: primaryColor,
        icon: Icon(
          icon,
          color: thirdColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Image.asset(
          pathImage,
          height: 200.0,
          // width: 20.0,
        ),
        content: Text(
          text,
          style: const TextStyle(
            color: secondColor,
            fontSize: 18.0,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: const TextStyle(
                color: secondColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
