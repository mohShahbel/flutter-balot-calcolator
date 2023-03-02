import 'dart:math';

import 'package:balot/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RotatedArrow extends StatefulWidget {
  const RotatedArrow({super.key, required this.height});
  final double height;

  @override
  State<RotatedArrow> createState() => _RotatedArrowState();
}

class _RotatedArrowState extends State<RotatedArrow> {
  @override
  Widget build(BuildContext context) {
    int angle = Provider.of<MyProvider>(context).angle;
    return Transform.rotate(
      angle: angle * pi / 2,
      child: GestureDetector(
        onTap: () {
          setState(() {
            Provider.of<MyProvider>(context, listen: false).rotate();
          });
        },
        child: Icon(
          Icons.arrow_back,
          size: widget.height * 0.08,
        ),
      ),
    );
  }
}
