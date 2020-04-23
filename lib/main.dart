import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/aboutus.dart';
import 'package:dbdummy/screens/accountScreen.dart';
import 'package:dbdummy/screens/adopter.dart';
import 'package:dbdummy/screens/adoptersDisplay.dart';
<<<<<<< HEAD
import 'package:dbdummy/screens/alreadyfilled.dart';
=======
import 'package:dbdummy/screens/buyerSq.dart';
>>>>>>> 176096e... c_fina
import 'package:dbdummy/screens/chatScreen.dart';
import 'package:dbdummy/screens/chatwithContacts.dart';
import 'package:dbdummy/screens/confirmadoption.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
<<<<<<< HEAD
import 'package:dbdummy/screens/petDisplay/petDisplayScreen.dart';
=======
import 'package:dbdummy/screens/petDisplayScreen.dart';
>>>>>>> 176096e... c_fina
import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

<<<<<<< HEAD
void main() => runApp(Myapp());
=======
void main() => runApp(Myapp()); 
>>>>>>> 176096e... c_fina
BuyerModel buyerModel= BuyerModel();
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
        route.homeScreen: (context) => HomeScreen(),
        route.ownerScreen: (context) => OwnerScreen(),
        
        route.confirmationScreen: (context) => ConfirmAdoption(context, buyerModel, mediaQuery),
        route.aboutUsScreen: (context) => AboutUsScreen(),
        route.temp: (context) => TabLoginController(),
        route.acceptorScreen: (context)=>AcceptorScreen(),
        
        route.petDisplay: (context)=> PetDisplay(mediaQuery),
        
          route.accountScreen: (context) => AccountScreen(),
          route.chatScreen: (context) => ChatScreen(),
          route.chatWith: (context) => ChatWithContact(),
<<<<<<< HEAD
          route.alreadyFilled:(context)=> AlreadyFilled(mediaQuery),
          route.adopterDisplay:(context)=> AdoptersDisplay(mediaQuery),
=======
          route.adopterDisplay:(context)=> AdoptersDisplay(mediaQuery),
          route.buyerSq:(context)=> BuyerSqflite(),
>>>>>>> 176096e... c_fina
        
      },
    );
  }
}
