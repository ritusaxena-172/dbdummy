import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Firebase signup and exception handling
String errorMessage;
userSignup(context, signUpModel) {
  print('inisde sign up');
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: signUpModel.signupemail, password: signUpModel.signuppassword)
      .then((currentUser){
        print(currentUser);
        Firestore.instance
              .collection("users")
              .document(currentUser.user.uid)
              .setData({
            "uid": currentUser.user.uid,
            "name": signUpModel.signupname,
            "phone number": signUpModel.signupphone,
            "currentUSERID": currentUser.user.uid,
          }).then((result) => {

                    Navigator.pushNamed(context, Routes().temp),
                  });})
      .catchError((error) {
    print('error is $error');
    switch (error.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = emailInUse;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_INVALID_EMAIL":
        errorMessage = invalidEmail;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        errorMessage = networkError;
        showAlertDialog(context, errorMessage);
        break;
      default:
        errorMessage = defaultError;
        showAlertDialog(context, errorMessage);
    }
  });
}
