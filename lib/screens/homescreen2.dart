import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';
class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}
class _HomeScreen2State extends State<HomeScreen2> {
  String ksharedemail = '';
  @override
  void initState() {
    getPreference().then(updateName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
      drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(ksharedemail),
              decoration: BoxDecoration(
                color: secondcolor,
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: firstcolor,
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Card(
                child: ListTile(
                    leading: Icon(Icons.chat, color: firstcolor),
                    title: Text('Chat with Contacts'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes().chatWith);
                    })),
            Card(
                child: ListTile(
                    leading: Icon(Icons.account_circle, color: firstcolor),
                    title: Text('My Account'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes().accountScreen);
                    })),
            Card(
                child: ListTile(
                    leading: Icon(Icons.power_settings_new, color: firstcolor),
                    title: Text('Log Out'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes().splashScreen);
                    }))
          ],
        )),
        body: Column(children: <Widget>[
          Container(
              height: 240,
              width: 700,
              //  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              // child: Material(
              //     elevation: 9.0,
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(7),
              //   bottomRight: Radius.circular(7),
              // )),
              // child: Padding(
              //     padding: EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Carousel(
                    images: [
                      AssetImage(carousel1),
                      AssetImage(carousel2),
                      AssetImage(carousel3),
                      AssetImage(carousel4),
                      AssetImage(carousel5),
                    ],
                    autoplayDuration: Duration(
                      seconds: 3,
                    ),
                    animationDuration: Duration(
                      milliseconds: 800,
                    ),
                    dotSize: 4.0,
                    //  dotBgColor: Colors.white
                  ))),
          //)
          //)
          Container(
            height: 50,
            width: 390,
            child: Center(
                child: Text(
              ':feet: Choose your service.:feet:',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontFamily: 'Florsn',
              ),
            )),
          ),
          GestureDetector(
            onTap: () {
              getUID();
              Navigator.pushNamed(context, Routes().acceptorScreen);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  //  padding: EdgeInsets.all(90),
                  margin: EdgeInsets.fromLTRB(10, 30, 80, 5),
                  height: 100,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        card1,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'For Adoption',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 30, 80, 5),
                  height: 100,
                  width: 390,
                  color: Colors.green.withOpacity(0.6),
                  // child: Text('Adopt a pet'),
                ),
              ],
            ),
          ),
          
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes().ownerScreen);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(80, 20, 10, 5),
                  height: 100,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        card2,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                          text: 'For Shelter',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(80, 20, 10, 5),
                  height: 100,
                  width: 390,
                  color: Colors.pink.withOpacity(0.6),
                ),
              ],
            ),
          ),
          
          
          
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 80, 5),
                  height: 100,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        card3,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 20, 80, 5),
                  height: 100,
                  width: 390,
                  color: Colors.red.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ]));
  }
  void updateName(String email) {
    setState(() {
      this.ksharedemail = email;
    });
  }
}











