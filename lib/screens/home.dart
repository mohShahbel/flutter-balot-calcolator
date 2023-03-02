import 'package:balot/constant.dart';
import 'package:balot/screens/componenet/game_reslut_card.dart';
import 'package:balot/screens/componenet/record_button.dart';
import 'package:flutter/material.dart';
import 'componenet/option_button.dart';
import 'componenet/players_title_card.dart';
import 'componenet/result_entering_board.dart';
import 'componenet/sub_game_result.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // take full height and width of the device
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: OpetinButton(height: height),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // padiding from top  of the screen
              const SizedBox(height: defaultPadding * 2),

              // title of the two teams (لنا - لهم)
              PlayersTitleCard(height: height),

              // result of each team
              GameResultCard(height: height),

              // TextFeild to enter games result
              const ResultEnteringBoard(),

              // Button to Record the results
              RecordButton(height: height),

              const Divider(thickness: 2, color: Colors.black38),

              // List of each team sub result
              SubGameResult(height: height)
            ],
          ),
        ),
      ),
    );
  }
}
