import 'package:balot/constant.dart';
import 'package:balot/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpetinButton extends StatelessWidget {
  const OpetinButton({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      child: const Icon(
        Icons.settings,
        size: 35,
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
            child: CupertinoAlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackOptionButton(height: height),
                  NewGameButton(height: height)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewGameButton extends StatelessWidget {
  const NewGameButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text("هل تريد بداية لعبة جديدة؟"),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: const Text('لا'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Provider.of<MyProvider>(context, listen: false).reset();
                      Navigator.pop(context);
                    },
                    child: const Text('نعم')),
              ],
            );
          },
        );
      },
      color: primaryColor,
      child: Text(
        "لعبة جديدة",
        style: TextStyle(
          fontSize: height * 0.025,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BackOptionButton extends StatelessWidget {
  const BackOptionButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text("هل تريد التراجع؟"),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: const Text('لا'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                      if (Provider.of<MyProvider>(context, listen: false)
                              .playerOne
                              .isEmpty &&
                          Provider.of<MyProvider>(context, listen: false)
                              .playerTwo
                              .isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text("لا يوجد شي للتراجع عنه"),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text("موافق"),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        Provider.of<MyProvider>(context, listen: false)
                            .goback();
                      }
                    },
                    child: const Text('نعم')),
              ],
            );
          },
        );
      },
      color: primaryColor,
      child: Text(
        "تراجع",
        style: TextStyle(
          fontSize: height * 0.025,
          color: Colors.white,
        ),
      ),
    );
  }
}
