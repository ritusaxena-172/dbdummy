//import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/screens/breed.dart';
import 'package:dbdummy/screens/splashscreen.dart';
//import 'package:dbdummy/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
