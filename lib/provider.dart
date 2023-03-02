// ignore_for_file: depend_on_referenced_packages

import 'package:balot/screens/componenet/win_player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MyProvider with ChangeNotifier {
  // Variables
  int angle = 15;
  var playOneController = TextEditingController();
  var playTowController = TextEditingController();
  bool gameOver = false;
  List<int> playerOne = [];
  List<int> playerTwo = [];

  //method To reset of the game
  void reset() {
    playOneController.clear();
    playTowController.clear();
    playerOne.clear();
    playerTwo.clear();
    gameOver = false;

    notifyListeners();
  }

  //method To go back the last game
  void goback() {
    if (playerOne.isEmpty == false || playerTwo.isEmpty == false) {
      playerOne.removeAt(playerOne.length - 1);
      playerTwo.removeAt(playerTwo.length - 1);
      gameOver = false;
      angle += 5;
    }

    notifyListeners();
  }

  // method to add game value to players result
  void add(BuildContext context) {
    // if the player enter one text value the other text value will be 0
    if (playOneController.text.isEmpty && playTowController.text.isNotEmpty) {
      playOneController = TextEditingController()..text = '0';
    }
    if (playTowController.text.isEmpty && playOneController.text.isNotEmpty) {
      playTowController = TextEditingController()..text = '0';
    }

    // if the two values is empity, display message dialog warning
    if (playOneController.text.isEmpty && playTowController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("لا توجد قيم"),
            content: const Text("تأكد من ادخال القيم"),
            actions: [
              CupertinoDialogAction(
                child: const Text("حسناً"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
      playOneController.clear();
      playTowController.clear();
      return;
    }

    // if one of values is negative, display message dialog warning
    if (int.parse(playOneController.text) < 0 ||
        int.parse(playTowController.text) < 0) {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("لا يمكن ادخال قيم عكسية"),
            content: const Text("تأكد من ادخال القيم"),
            actions: [
              CupertinoDialogAction(
                child: const Text("حسناً"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
      playOneController.clear();
      playTowController.clear();
      return;
    }

    // add values to player result list
    playerOne.add(int.parse(playOneController.text));
    playerTwo.add(int.parse(playTowController.text));

    // decrease the angle variable by 5
    angle -= 5;

    // clear the two text value
    playOneController.clear();
    playTowController.clear();

    //when one of the player result egual transcend 152 display game over message
    if (playerOne.sum >= 152 || playerTwo.sum >= 152) {
      winPlayer(context);
    }

    notifyListeners();
  }

  // method to rotate the arrow that pointing to the current player
  void rotate() {
    angle -= 5;
    if (angle < 0) {
      angle = 15;
    }

    notifyListeners();
  }
}
