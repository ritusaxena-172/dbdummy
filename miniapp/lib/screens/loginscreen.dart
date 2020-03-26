import 'dart:ui';
import 'package:dbdummy/model/firebasemodel.dart';
import 'package:dbdummy/model/login_model.dart';
import 'package:dbdummy/provider/validators.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/screens/signupscreen.dart';
import 'package:dbdummy/services/firebasesignature.dart';
import 'package:dbdummy/services/sharedpreference.dart';
import 'package:dbdummy/utils/color_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {
  final kformKey = GlobalKey<FormState>();
  final kalertformkey = GlobalKey<FormState>();
  // AlertDialog alert = AlertDialog(
  //   title: Text(
  //     "Alert!",
  //     style: TextStyle(color: Colors.red),
  //   ),
  //   content: Text("Incorrect user/password."),
  // );
  //   createAlertDialogueBox(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           child: Form(
  //             key: kalertformkey,
  //             child: Card(
  //               child: Container(
  //                   width: 300,
  //                   height: 300,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.rectangle,
  //                     border: Border.all(color: Colors.black, width: 2),
  //                   ),
  //                   child: Column(children: <Widget>[
  //                     Expanded(
  //                       flex: 1,
  //                       child: Text(
  //                         'Change Password',
  //                         style: TextStyle(fontSize: 30),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       flex: 1,
  //                       child: TextFormField(
  //                         obscureText: newPasswordVisible,
  //                         autovalidate: autovalidateemail,
  //                         onEditingComplete: () {
  //                           setState(() {
  //                             autovalidateemail = true;
  //                           });
  //                         },
  //                         validator: passwordValidation,
  //                         onChanged: (value) {
  //                           setState(() {
  //                             signinpassword = value;
  //                           });
  //                         },
  //                         decoration: InputDecoration(
  //                           enabledBorder: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(40),
  //                               borderSide: BorderSide(color: firstcolor)),
  //                           prefixIcon: Icon(
  //                             Icons.lock,
  //                             size: 20.0,
  //                             color: firstcolor,
  //                           ),
  //                           hintText: 'Enter New Password',
  //                         ),
  //                         // controller: newPassword,
  //                       ),
  //                     ),
  //                     Expanded(
  //                       flex: 1,
  //                       child: Container(
  //                         child: TextFormField(
  //                           obscureText: newPasswordVisible,
  //                           autovalidate: autovalidateemail,
  //                           onEditingComplete: () {
  //                             setState(() {
  //                               autovalidateemail = true;
  //                             });
  //                           },
  //                           validator: confirmpassword,
  //                           onChanged: (value) {
  //                             setState(() {
  //                               signinemail = value;
  //                             });
  //                           },
  //                           decoration: InputDecoration(
  //                             enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(40),
  //                                 borderSide: BorderSide(color: firstcolor)),
  //                             prefixIcon: Icon(
  //                               Icons.mail,
  //                               size: 20.0,
  //                               color: firstcolor,
  //                             ),
  //                             hintText: 'Confirm New Password',
  //                           ),
  //                           // controller: newPasswordConfirm,
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                         width: 280,
  //                         child: RaisedButton(
  //                           color: firstcolor,
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: new BorderRadius.circular(40.0),
  //                               side: BorderSide(color: Colors.white)),
  //                           onPressed: () {
  //                             if (kalertformkey.currentState.validate()) {
  //                               kalertformkey.currentState.save();
  //                             }},
  //                           child: Text('Submit'),
  //                         )),
  //                   ])),
  //             ),
  //           ),
  //         );
  //       });
  // }
  // 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Form(
            key: kformKey,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/catdog.jpg"),
                    fit: BoxFit.fill,
                    // width: 600, height: 600,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
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
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                          Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 150,
                                  child: RaisedButton(
                                    color: loginpress ? disable : firstcolor,
                                    onPressed: () {
                                      loginpress = true;
                                      signuppress = false;
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginScreen()),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Text('Login'),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40)),
                                    child: Text('Signup'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  boxShadow: kElevationToShadow[1],
                                   ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        child: TextFormField(
                                          autovalidate: autovalidateemail,
                                          onEditingComplete: () {
                                            setState(() {
                                              autovalidateemail = true;
                                            });
                                          },
                                          validator: emailValidation,
                                          onChanged: (value) {
                                            setState(() {
                                              signinemail = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                borderSide: BorderSide(
                                                    color: firstcolor)),
                                            prefixIcon: Icon(
                                              Icons.mail,
                                              size: 20.0,
                                              color: firstcolor,
                                            ),
                                            hintText: 'Enter email id',
                                          ),
                                          ), // ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        child: TextFormField(
                                          autovalidate: autovalidatepassword,
                                          onEditingComplete: () {
                                            setState(() {
                                              autovalidatepassword = true;
                                            });
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              signinpassword = value;
                                            });
                                          },
                                          obscureText: passwordVisible,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  borderSide: BorderSide(
                                                      color: firstcolor)),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                size: 20.0,
                                                color: firstcolor,
                                              ),
                                              hintText: 'Enter password',
                                              suffixIcon: IconButton(
                                                  icon: Icon(
                                                    passwordVisible
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: firstcolor,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      passwordVisible =
                                                          !passwordVisible;
                                                    });
                                                  })), //controller: password,
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 1,
                                    //   child: GestureDetector(
                                    //       onTap: () {
                                    //         createAlertDialogueBox(context);
                                    //       },
                                    //       child: Container(
                                    //         margin: EdgeInsets.only(bottom: 40),
                                    //         padding: EdgeInsets.all(10),
                                    //         child: Text('Forgot password?'),
                                    //         //color: Colors.grey[300],
                                    //         alignment: Alignment.bottomRight,
                                    //       )),
                                    // ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 300,
                                        child: RaisedButton(
                                          color: firstcolor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              side: BorderSide(
                                                  color: Colors.white)),
                                          onPressed: () async {
                                            final formState =
                                                kformKey.currentState;
                                            if (formState.validate()) {
                                                  formState.save();
                                                  saveData();
                                                  try {
                                                    await FirebaseAuth.instance
                                                        .signInWithEmailAndPassword(
                                                            email: signinemail,
                                                            password: signinpassword);
                                                            getUID();
                                                             print('inside login, uisd is: $uid');
                                                         Navigator.pushReplacement(
                                                        context,
                                                         MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeScreen()),
                                                );
                                              } catch (e) {
                                                flag = 1;
                                                print(e.message);
                                              }
                                              // if (flag != 0) {
                                              //   showDialog(
                                              //     context: context,
                                              //     builder:
                                              //         (BuildContext context) {
                                              //       return alert;
                                              //     },
                                              //   );
                                              // }
                                            }
                                          },
                                          child: Text('Login'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                           
                          )
                        ]),
                  ],
                ))),
      ),
    );
  }
}
