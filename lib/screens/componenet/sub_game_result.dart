import 'package:balot/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubGameResult extends StatelessWidget {
  const SubGameResult({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.5,
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: Provider.of<MyProvider>(context).playerOne.length,
              itemBuilder: (context, index) {
                return Text(
                    Provider.of<MyProvider>(context)
                        .playerOne[index]
                        .toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: height * 0.04,
                    ));
              },
            ),
          ),
          const Expanded(
              flex: 2,
              child: VerticalDivider(
                thickness: 2.5,
                color: Colors.black38,
              )),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: Provider.of<MyProvider>(context).playerTwo.length,
              itemBuilder: (context, index) {
                return Text(
                  Provider.of<MyProvider>(context).playerTwo[index].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.04,
                  ),
                );
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
