import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/signuomodel.dart';
// import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/provider/validators.dart';
// import 'package:dbdummy/services/firebasesignup_services.dart';
import 'package:dbdummy/utils/color_service.dart';
// import 'package:dbdummy/utils/color_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Formpage(),
      ),
    );
  }
}
class Formpage extends StatefulWidget {
  @override
  _FormpageState createState() => _FormpageState();
}
class _FormpageState extends State<Formpage> {
  add() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: signupemail, password: signuppassword)
        .then((currentUser) => Firestore.instance
                .collection("users")
                .document(currentUser.user.uid)
                .setData({
              "uid": currentUser.user.uid,
              "name": signupname,
              "phone number": signupphone,
              "currentUSERID":currentUser.user.uid,
              
            }).then((result) => {
              Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen())
              )     }));
  }



  // Furture currentuid() async{
  //   String usersid=(await FirebaseAuth.instance.currentUser()).uid;
  // }
    // void add() async {
  //    Map<String, String> data = <String, String>{
  //     "name": signupname,
  //     "phone number": signupphone,
  //    };
  //   //  String currentUserID=getUID();
  //     // print('uid is ${getUID()}');
  //   //  print('uid for this user is : ${currentUserID}');
  //   //  print('uid is ${uid}');
  //   // userCollection.document(currentUserID).setData(data);
  //   userCollection.document(currrentUserID).setData(data).then((_){Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));});
  //   //  userCollection.document(currentUserID).setData(data).then((_) {
      
  //   // });
  // }
  final kformKey = GlobalKey<FormState>();
  // void add() async {
  // String uid = (await FirebaseAuth.instance.currentUser())?.uid;
  //   print('UID is:${uid}');
  //   Map<String, String> data = <String, String>{
  //     "name": signupname,
  //     "phone number": signupphone,
  //    };
  //    userCollection.document(uid).setData(data).then((_) {
  //     Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: kformKey,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/catdog.jpg"),
                fit: BoxFit.fill,
                // width: 600, height: 600,
              ),
            ),
            child: Stack(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.pets,
                      color: firstcolor,
                      size: 50.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150.0),
                  ),
                  Text(
                    'PawSome',
                    style: TextStyle(
                        color: light, fontFamily: 'Florsn', fontSize: 35.0),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        // 1st column
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 150,
                            child: OutlineButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80),
                              ),
                              // borderSide:
                              //     BorderSide(color: Colors.purple, width: 2),

                              child: Text('Login'),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: RaisedButton(
                              color: signuppress ? disable : firstcolor,
                              onPressed: () {
                                signuppress = true;
                                loginpress = false;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80)),
                              // focusColor: Colors.red,
                              // disabledBorderColor: Colors.grey,
                              child: Text('Signup'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          boxShadow: kElevationToShadow[1],
                          //   border: Border.all(
                          //       width: 2,
                          //       // color: Colors.yellow,
                          //       style: BorderStyle.solid),
                          //
                        ),
                        child: Column(children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                autovalidate: autovalidatename,
                                onEditingComplete: () {
                                  setState(() {
                                    autovalidatename = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: firstcolor)),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 20.0,
                                    color: firstcolor,
                                  ),
                                  labelText: 'Name',
                                  hintStyle: TextStyle(color: firstcolor),
                                  //icon: Icon(Icons.person, color: firstcolor),
                                ),
                                validator: nameValidation,
                                onChanged: (value) {
                                  setState(() {
                                    signupname = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration:
                                  BoxDecoration(shape: BoxShape.rectangle),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                autovalidate: autovalidateemail,
                                onEditingComplete: () {
                                  setState(() {
                                    autovalidateemail = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: firstcolor)),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    size: 20.0,
                                    color: firstcolor,
                                  ),
                                  labelText: 'Email',
                                  hintStyle: TextStyle(color: firstcolor),
                                ),
                                validator: emailValidation,
                                onChanged: (value) {
                                  setState(() {
                                    signupemail = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          //phone number
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration:
                                  BoxDecoration(shape: BoxShape.rectangle),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                autovalidate: autovalidatenumber,
                                onEditingComplete: () {
                                  setState(() {
                                    autovalidateemail = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: firstcolor)),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    size: 20.0,
                                    color: firstcolor,
                                  ),
                                  labelText: 'Phone',
                                  hintStyle: TextStyle(color: firstcolor),
                                ),
                                validator: numberValidation,
                                onChanged: (value) {
                                  setState(() {
                                    signupphone = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          //for password
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration:
                                  BoxDecoration(shape: BoxShape.rectangle),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: secure1,
                                autovalidate: autovalidatepassword,
                                onEditingComplete: () {
                                  setState(() {
                                    autovalidatepassword = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: firstcolor)),
                                  prefixIcon: Icon(
                                    Icons.enhanced_encryption,
                                    size: 20.0,
                                    color: firstcolor,
                                  ),
                                  hintStyle: TextStyle(color: firstcolor),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      secure1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: firstcolor,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        secure1 = !secure1;
                                      });
                                    },
                                  ),
                                ),
                                validator: passwordValidation,
                                onChanged: (value) {
                                  setState(() {
                                    signuppassword = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: secure2,
                                autovalidate: autoconfirmpassword,
                                onEditingComplete: () {
                                  setState(() {
                                    autoconfirmpassword = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: firstcolor)),
                                  prefixIcon: Icon(
                                    Icons.enhanced_encryption,
                                    size: 20.0,
                                    color: firstcolor,
                                  ),
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      secure1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: firstcolor,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        secure1 = !secure1;
                                      });
                                    },
                                  ),
                                ),
                                validator: confirmpassword,
                                onChanged: (value) {
                                  setState(() {
                                    signuppassword = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                width: 300,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                child: RaisedButton(
                                  color: firstcolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(40.0),
                                      side: BorderSide(color: light)),
                                    onPressed: () async {
                                    final formState = kformKey.currentState;
                                    if (formState.validate()) {
                                      formState.save();
                                      try {
                                        add();
                                        // print('here');
                                        //  print(currentUSERID);
                                        //  print('sign up name is $signupname');
                                        // authenticate();
                                      } catch (e) {
                                        print(e.message);
                                      }
                                    }
                                  },
                                  child: Text('SignUp'),
                                )),
                          ),
                        ]),
                      ),
                    )
                  ])
            ])));
  }
}
