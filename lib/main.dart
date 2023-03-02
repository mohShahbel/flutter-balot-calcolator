import 'package:balot/constant.dart';
import 'package:balot/provider.dart';
import 'package:balot/screens/home.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: primaryColor));

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "صكة بلوت",
          theme: ThemeData(
            primaryColor: primaryColor,
          ),
          home: EasySplashScreen(
            durationInSeconds: 4,
            navigator: const Home(),
            backgroundColor: const Color.fromARGB(255, 99, 172, 160),
            logo: Image.asset(
              "assets/images/logo.png",
            ),
            logoWidth: 200,
            showLoader: true,
            title: const Text(
              "صكة بلوت",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}
