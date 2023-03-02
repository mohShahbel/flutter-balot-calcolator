import 'package:balot/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';

class ResultEnteringBoard extends StatelessWidget {
  const ResultEnteringBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              controller: Provider.of<MyProvider>(context).playOneController,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              cursorColor: Colors.grey,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 1,
            child: TextField(
              controller: Provider.of<MyProvider>(context).playTowController,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              cursorColor: Colors.grey,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
