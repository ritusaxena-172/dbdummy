import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/aboutus.dart';
import 'package:dbdummy/screens/adopter.dart';
import 'package:dbdummy/screens/buyser2.dart';
import 'package:dbdummy/screens/buyserscreen.dart';
import 'package:dbdummy/screens/confirmadoption.dart';
import 'package:dbdummy/screens/finalBuyerScreen.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/screens/homescreen2.dart';

import 'package:dbdummy/screens/ownerscreen.dart';

//import 'package:dbdummy/screens/signupsignin/signupsigninscreen.dart';
import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/screens/splashscreen.dart';
//import 'package:dbdummy/screens/homescreen.dart';
//import 'package:dbdummy/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Routes route = Routes();
  @override
  Widget build(BuildContext context) {
    //for portrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: route.splashScreen,
      routes: {
        route.splashScreen: (context) => SplashScreen(),
        route.homeScreen: (context) => HomeScreen2(),
        route.ownerScreen: (context) => OwnerScreen(),
        route.buyerScreen: (context) => BuyerScreenn(),
        route.confirmationScreen: (context) => ConfirmAdoption(),
        route.aboutUsScreen: (context) => AboutUsScreen(),
        route.temp: (context) => TabLoginController(),
        route.acceptorScreen: (context)=>AcceptorScreen(),
        route.finalBuyer: (context) =>BuyerScreennn(),
      },
    );
  }
}
