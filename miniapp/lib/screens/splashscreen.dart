import 'dart:async';
import 'package:dbdummy/utils/color_service.dart';
// import 'package:dbdummy/utils/color_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          colors: [firstcolor, secondcolor],
        ))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.pets,
                    size: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Text(
                  'PawSome',
                  style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Florsn',
                      fontSize: 35.0),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.only(bottom: 10.0),
              child: SpinKitFadingCube(
                color: splashcolor,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
