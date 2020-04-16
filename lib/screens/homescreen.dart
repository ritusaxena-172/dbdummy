import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
// import 'package:dbdummy/provider/checkFormFilled.dart';
// import 'package:dbdummy/provider/checkPetFormFilled.dart';
import 'package:dbdummy/routes/routes.dart';
// import 'package:dbdummy/screens/buyser2.dart';
// import 'package:dbdummy/screens/buyserscreen.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/services/formfilledCheck.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';
import 'package:dbdummy/services/siginwithgoogle.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:dbdummy/viewModel/checkFormFilled.dart';
import 'package:dbdummy/viewModel/checkPetFormFilled.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
DocumentSnapshot documentSnapshotAdopter;
DocumentSnapshot documentSnapshotOwner;
class _HomeScreenState extends State<HomeScreen> {
  String ksharedemail = '';
  @override
  void initState() {
    getPreference().then(updateName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
          child: Column(children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 300,
                  width: 700,
                  //  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Material(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    )),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Carousel(
                              images: [
                                AssetImage("assets/images/carosel1.jpg"),
                                AssetImage("assets/images/carosel2.jpg"),
                                AssetImage("assets/images/carosel3.jpg"),
                                AssetImage("assets/images/carousel4.jpeg"),
                                AssetImage("assets/images/carosel5.jpg"),
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
                  )),
            ),
            
            Container(
            height: 50,
            width: 390,
            child: Center(
                child: Text(
              ' Choose your service.',
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
                getDetails('AcceptorDetails').then((result){
               documentSnapshotAdopter=result;
                });
              checkFormFilled(documentSnapshotAdopter,context);
              // Navigator.pushNamed(context, Routes().acceptorScreen);
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
             getUID();
                getDetails('PetDetails').then((result){
               documentSnapshotOwner=result;
                });
                checkPetFormFilled(documentSnapshotOwner, context);
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
          
          
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text('Adopt, don\'t shop!',
                        style: TextStyle(
                          fontSize: 40,
                          color: secondcolor,
                          fontStyle: FontStyle.italic,
                        )))),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     Expanded(
            //       flex: 2,
            //       child: Container(
            //         margin: EdgeInsets.fromLTRB(20, 0, 10, 120),
            //         child: RaisedButton(
            //           color: firstcolor,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: new BorderRadius.circular(40.0),
            //               side: BorderSide(color: Colors.white)),
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => OwnerScreen()));
            //           },
            //           child: Text('Looking for shelter?'),
            //           padding: EdgeInsets.all(10),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 2,
            //       child: Container(
            //         margin: EdgeInsets.fromLTRB(10, 0, 20, 120),
            //         child: RaisedButton(
            //           color: secondcolor,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: new BorderRadius.circular(40.0),
            //               side: BorderSide(color: Colors.white)),
            //           onPressed: () {
            //             getUID();
            //             getDetails('AcceptorDetails').then((result){
            //               documentSnapshot=result;

                         
            //             });
                        
            //              checkFormFilled(documentSnapshot,context);
            //           },
            //           child: Text('Looking for adoption?'),
            //           padding: EdgeInsets.all(10),
            //         ),
            //       ),
            //     )
            //   ],
            // )
       
          ]),
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
                    title: Text('About us'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes().aboutUsScreen);
                    })),
            Card(
                child: ListTile(
                    title: Text('Log Out'),
                    onTap: () {
                      signOutGoogle();
                      Navigator.pushNamed(context, Routes().splashScreen);
                    }))
          ],
        )));
  }

//update name for shared preferences
  void updateName(String email) {
    setState(() {
      this.ksharedemail = email;
    });
  }
}
