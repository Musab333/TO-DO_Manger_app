import 'package:flutter/material.dart';

import '../../shared/styles/color_app.dart';

Future<dynamic> showDialogCustom(context) async {
  return await showDialog<String>(
    context: context,
    builder: (BuildContext context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: primaryColor,
        //shadowColor: thirdColor,
        icon: const Icon(
          Icons.task_alt,
          color: thirdColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text(
          'صباح الخير, عبدالله',
          style: TextStyle(
            color: secondColor,
            fontSize: 22.0,
          ),
        ),
        content: const Text(
          'ماهي المهام التي تريد ان تقوم بيها اليوم ؟',
          style: TextStyle(
            color: secondColor,
            fontSize: 18.0,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'حسنآ');
            },
            child: const Text(
              'حسنآ',
              style: TextStyle(
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
