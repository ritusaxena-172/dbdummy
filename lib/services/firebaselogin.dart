import 'package:dbdummy/database/currentUID.dart';
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String errorMessage;
// Firebase signin and exception handling
Future userLogin(context, SignInModel signInModel) async {
  try {
    print('inside');
    print(' here ${signInModel.signinemail}');
    print(signInModel.signinpassword);// primntinh till this point
    final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(// not entering here
        email: signInModel.signinemail, password: signInModel.signinpassword)).user;
    print(user.email);
    print('here again');
    getUID();
    await Navigator.pushReplacementNamed(context, Routes().homeScreen);
  } catch (error) {      
    print(error);
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = invalidEmail;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = invalidPassword;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = userNotFound;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = userDisabled;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = tooManyRequests;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_USER_TOKEN_EXPIRED":
        errorMessage = invalidCredentials;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE ":
        errorMessage = emailInUse;
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
  }
  if (errorMessage != null) {
    return Future.error(errorMessage);
  }
}
