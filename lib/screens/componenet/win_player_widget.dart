// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../../provider.dart';

Future<dynamic> winPlayer(BuildContext context) {
  int sumPlayerOne =
      Provider.of<MyProvider>(context, listen: false).playerOne.sum;
  int sumPlayerTwo =
      Provider.of<MyProvider>(context, listen: false).playerTwo.sum;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sumPlayerOne >= 152
                    ? const Text("كفو مبروك ")
                    : const Text("فداك يعوضك الله"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(" لكم $sumPlayerOne ولهم $sumPlayerTwo")],
            )
          ],
        ),
        content: const Text("هل تريد بداية لعبة جديدة؟"),
        actions: <Widget>[
          CupertinoDialogAction(
              child: const Text('تراجع؟'),
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false).goback();
                Navigator.pop(context);
              }),
          CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false).reset();
                Navigator.pop(context);
              },
              child: const Text('صكة جديدة؟'))
        ],
      );
    },
  );
}
