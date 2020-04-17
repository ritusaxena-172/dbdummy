import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/viewModel/firebaseErrors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String errorMessage;

// Firebase signin and exception handling
Future userLogin(context, SignInModel signInModel) async {
  try {
    final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: signInModel.signinemail,
            password: signInModel.signinpassword))
        .user;
    print(user.email);
    getUID();
    await Navigator.pushReplacementNamed(context, Routes().homeScreen);
  } catch (error) {
    print(error);
    catchFirebaseErrors(context, error);
  }
  if (errorMessage != null) {
    return Future.error(errorMessage);
  }
}
