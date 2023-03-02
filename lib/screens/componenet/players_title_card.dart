import 'package:balot/screens/componenet/rotate_arrow.dart';
import 'package:flutter/material.dart';

class PlayersTitleCard extends StatelessWidget {
  const PlayersTitleCard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 3,
          child: Center(
            child: Text(
              "لنا",
              style: TextStyle(
                fontSize: height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
         Expanded(child: RotatedArrow(height: height,)),
        Flexible(
          flex: 3,
          child: Center(
            child: Text(
              "لهم",
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
