import 'package:balot/constant.dart';
import 'package:balot/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding / 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: MaterialButton(
                onPressed: () {
                  Provider.of<MyProvider>(context, listen: false).add(context);
                },
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
                child: Text(
                  "سجل",
                  style: TextStyle(
                    fontSize: height * 0.035,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
