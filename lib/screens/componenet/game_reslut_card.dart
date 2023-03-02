// ignore_for_file: depend_on_referenced_packages

import 'package:balot/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class GameResultCard extends StatelessWidget {
  const GameResultCard({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    int sumOfPlayerOne =
        int.parse(Provider.of<MyProvider>(context).playerOne.sum.toString());
    int sumOfPlayerTwo =
        int.parse(Provider.of<MyProvider>(context).playerTwo.sum.toString());
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Flexible(
          flex: 3,
          child: Center(
            child: Text(
              "$sumOfPlayerOne",
              style: TextStyle(
                fontSize: height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 3,
          child: Center(
            child: Text(
              "$sumOfPlayerTwo",
              style: TextStyle(
                fontSize: height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
